import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_flutter_app/generated/person.pb.dart';
import 'package:grpc_flutter_app/generated/person.pbgrpc.dart';
import 'package:grpc_flutter_app/generated/streams.pbgrpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GrpcCall(),
    );
  }
}

class StreamMessageResponseWidget extends StatelessWidget {
  final StreamMessageResponse message;
  const StreamMessageResponseWidget(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(message.content);
  }
}

class GrpcCall extends StatefulWidget {
  const GrpcCall({Key? key}) : super(key: key);

  @override
  _GrpcCallState createState() => _GrpcCallState();
}

class _GrpcCallState extends State<GrpcCall> {
  String sendStreamText = '';
  String personName = '';

  List<StreamMessageResponseWidget> messagesResponses = [];

  final channel = ClientChannel(
    '192.168.0.184',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  //final stub = GreeterClient(channel);


  Future getPersonDetail()async{
    final stub = PersonClient(channel);
    final message = GetPersonMessage(personId: '1-abc');

    final response = await stub.getPersonDetail(message);
    setState(() {
      personName = response.name;
    });
  }


  Future getServerStream() async{
    final stub = StreamsClient(channel);
    final messageRequest = StreamMessageRequest(content: 'request');

    await for (var msg in stub.getServerStreams(messageRequest)) {
      setState(() {
        messagesResponses.add(StreamMessageResponseWidget(msg));
      });
    }
  }

  Future sendServerStream() async {
    setState(() {
      sendStreamText = 'sending stream to server';
    });
    final stub = StreamsClient(channel);

    Stream<StreamMessageRequest> generateStream() async*{
      final inputMessages = <StreamMessageRequest>[
        StreamMessageRequest(content: 'Client message 1'),
        StreamMessageRequest(content: 'Client message 2'),
        StreamMessageRequest(content: 'Client message 3'),
        StreamMessageRequest(content: 'Client message 4'),
        StreamMessageRequest(content: 'Client message 5'),
      ];

      for (var msg  in inputMessages) {
        yield msg;
        await Future.delayed(Duration(seconds: 1));
      }
    }

    var response = await stub.sendServerStreams(generateStream());
    setState(() {
      sendStreamText = response.content;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('obter nome pessoa'),
                onPressed: () async {
                  await getPersonDetail();
                }),
            Text('nome pessoa: ${personName}'),

            ElevatedButton(
                child: const Text('send server stream'),
                onPressed: ()  async {
                  await sendServerStream();
                }),
            Text(sendStreamText),
            ElevatedButton(
                child: const Text('get server stream'),
                onPressed: ()  async {
                  await getServerStream();
                }),
            Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: messagesResponses.length,
                  itemBuilder: (BuildContext ctx, int index){
                    return Container(
                      child: Center(child: messagesResponses[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
