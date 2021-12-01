var container = document.createElement('demo-list');
var imageList = [
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN018PCyuq1VtgQcZ3LPo_!!0-fleamarket.jpg", "width": 1920, "height": 1277},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01yQ40Co1VtgQQ4cXFd_!!0-fleamarket.jpg", "width": 1920, "height": 1293},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01hQF3491VtgQYqgQ19_!!0-fleamarket.jpg", "width": 546, "height": 410},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01wHgeA81VtgQWm4SVd_!!0-fleamarket.jpg", "width": 1500, "height": 1126},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01VSCW5R1VtgQenDV9U_!!0-fleamarket.jpg", "width": 489, "height": 322},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01YfAia41VtgQe6ZXoo_!!0-fleamarket.jpg", "width": 600, "height": 450},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01j45FI61Vf1imOSe2y_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN012Xs5p61Vf1ihJtPdF_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01DIfYLC1Vf1ikYOVEF_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01xJrKgy1Vf1iaiZCK0_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01AzZZAc1Vf1ipKFmi6_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01eGluy91Vf1ijZL3Pf_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01VPThjf1Vf1imnkJ2u_!!0-fleamarket.jpg", "width": 1662, "height": 1247},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01tRChS31Vf1imORhps_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01JUGQgu1nEbziG05lu_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01eobDnM1nEbzrvA8u5_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01s3ERTU1nEbzbYGNVV_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01FXlQWg1nEbzpbMssh_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01MhRAK41nEbzkLH0Ia_!!0-fleamarket.jpg", "width": 1662, "height": 1247},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01wcfPMX1nEbzhfbQqx_!!0-fleamarket.jpg", "width": 1247, "height": 1662},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01Nrjc2i2ArkzYssY0c_!!0-fleamarket.jpg", "width": 1440, "height": 1080},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i3\/O1CN01DtxLqo2Arkzh45PNj_!!0-fleamarket.jpg", "width": 1080, "height": 1440},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01hXEQQt2ArkzbOx2Rr_!!0-fleamarket.jpg", "width": 1290, "height": 726},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01yGR30T2Arkzet7UyO_!!0-fleamarket.jpg", "width": 1080, "height": 1440},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01xoXcrT1HNFjrwaN8I_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01v0ybeY1HNFjsC3Jws_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01mYd3iD1HNFjtJ8Uw4_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01wHUHgX1HNFjtJ69PZ_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01DCWQEg1HNFjx51H1d_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i4\/O1CN01zoPBF51HNFjtJ6gg5_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01WQAfkH1HNFjqgv15R_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i1\/O1CN01bhcoHI1HNFjuYIhgF_!!0-fleamarket.jpg", "width": 1920, "height": 1920},
             {"url": "https:\/\/img.alicdn.com\/imgextra\/i2\/O1CN01rv3O7H1HNFjooKBAX_!!0-fleamarket.jpg", "width": 1920, "height": 1920}
           ];


//// 修改 display 为 sliver.
//container.style.display = 'sliver';
//// 必须指定渲染容器节点滚动方向的尺寸(height).
container.style.height = '200vh';

function _random() {
　　var index =  Math.floor(Math.random() * (imageList.length));
   var imgUrl = imageList[index];
   var url = imgUrl['url'];
   return url;
}

// 创建 100 个子节点.
for (let i = 0; i < 100; i++) {
  const item = document.createElement('div');
  item.style.background = '#e6e6e6';
  item.style.padding = '40rpx 40rpx';
  item.style.display = 'flex';


  const ele1 = document.createElement('div');
  ele1.style.display = 'flex';
  ele1.style.background = '#eee';


  const ele1Ima = document.createElement('div');
  ele1Ima.style.display = 'flex';
  ele1Ima.style.background = '#eee';
  ele1Ima.width = '100px';
  ele1Ima.height = '120px';


//  const img = new Image();
//  img.src = _random();
//  img.width = '100px';
//  img.height = '120px';
//  ele1Ima.appendChild(img);

  ele1.appendChild(ele1Ima);

  ele1.appendChild(document.createTextNode(`第 ${i + 1} 个元素`));
  item.appendChild(ele1);

  const ele2 = document.createElement('div');
  ele2.style.display = 'flex';
  ele2.style.background = '#eee';


  const ele2Ima = document.createElement('div');
  ele2Ima.style.display = 'flex';
  ele2Ima.style.background = '#eee';
  ele2Ima.width = '100px';
  ele2Ima.height = '120px';

//  const img2 = new Image();
//  img2.src = _random();
//  img2.width = '100px';
//  img2.height = '120px';

//  ele2Ima.appendChild(img2);
  ele2.appendChild(ele2Ima);


  ele2.appendChild(document.createTextNode(`第 ${i + 1} 个元素`));

  item.appendChild(ele2);

  container.appendChild(item);
}

document.body.appendChild(container);
