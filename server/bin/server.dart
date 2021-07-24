import 'package:grpc/grpc.dart';
import 'package:helloworld/src/generated/person.pbgrpc.dart';
import 'package:helloworld/src/generated/streams.pb.dart';
import 'package:helloworld/src/generated/streams.pbgrpc.dart';

class StreamsService extends StreamsServiceBase {
  @override
  Stream<StreamMessageResponse> getServerStreams(
      ServiceCall call, StreamMessageRequest request) async* {
    var responseMessages = <StreamMessageResponse>[
      StreamMessageResponse(content: 'Message 1'),
      StreamMessageResponse(content: 'Message 2'),
      StreamMessageResponse(content: 'Message 3'),
      StreamMessageResponse(content: 'Message 4'),
      StreamMessageResponse(content: 'Message 5'),
    ];

    for (var msg in responseMessages) {
      await Future.delayed(Duration(seconds: 1));
      yield msg;
    }
  }

  @override
  Future<StreamMessageResponse> sendServerStreams(
      ServiceCall call, Stream<StreamMessageRequest> request) async {
    await for (var msg in request) {
      print(msg.content);
    }

    return StreamMessageResponse(content: 'All messages received!');
  }
}

class PersonService extends PersonServiceBase {
  @override
  Future<PersonDetail> getPersonDetail(
      ServiceCall call, GetPersonMessage request) async {
    return PersonDetail(name: 'João Balão');
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [StreamsService(), PersonService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
