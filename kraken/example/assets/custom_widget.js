var text1 = document.createTextNode('Hello World!');
var text2 = document.createElement('flutter-text');

var list = document.createElement('demo-list');
list.appendChild(text1);
list.appendChild(text2);

//var p = document.createElement('p');
//p.appendChild(list);

document.body.appendChild(list);


