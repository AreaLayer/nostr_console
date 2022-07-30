import 'package:nostr_console/nostr_console.dart';
import 'package:test/test.dart';


EventData exampleEdata = EventData("id", "pubkey", "content", 1111111, 1, []);
EventData exampleEdataChild = EventData("id", "pubkey", "content child", 1111111, 1, []);

Event exampleEvent = Event('event', 'id', exampleEdata, ['relay name']);
Event exampleEventChild = Event('event', 'id', exampleEdataChild, ['relay name']);

EventNode exampleNode = EventNode(exampleEvent, []);
EventNode exampleNodeChild = EventNode(exampleEventChild, []);



void main() {
  test('PrintEmptyEvent', () {
    expect(EventData("non","","",1,1,[]).toString(), "");
  });

  test('printEventNode', () {


    EventNode node = exampleNode;
    EventNode childNode = exampleNodeChild;
    Event     cChild = exampleEventChild;

    childNode.addChild(cChild);

    node.addChildNode(childNode);
    node.addChildNode(childNode);

    print("node");
    node.printEventNode(4);

  });
}
