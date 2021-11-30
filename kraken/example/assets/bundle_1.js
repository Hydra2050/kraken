var text1 = document.createTextNode('Hello World!');
//var text2 = document.createElement('flutter-text');


//list.appendChild(text2);

var p = document.createElement('p');

var list = document.createElement('demo-list');
list.appendChild(p);
p.appendChild(text1);

document.body.appendChild(list);


