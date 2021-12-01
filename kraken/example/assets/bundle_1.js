var text1 = document.createTextNode('Hello World!');
//var text2 = document.createElement('flutter-text');


//list.appendChild(text2);

//var p = document.createElement('p');

var list = document.createElement('demo-list');

for (let i = 0; i < 100; i++) {
  var tmp = document.createTextNode('Hello World!');
  list.appendChild(tmp);
}
//list.appendChild(text1);
//p.appendChild(text1);

//var p = document.createElement('p');

document.body.appendChild(list);


