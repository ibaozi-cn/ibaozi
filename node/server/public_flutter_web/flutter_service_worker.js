'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "79fc52793fb2fc651fbcbbbb610440ce",
"/": "79fc52793fb2fc651fbcbbbb610440ce",
"main.dart.js.deps": "5caca3ef96b831d3736e3f6b90409778",
"main.dart.js": "2e08f9222f19da72c4ddb74be7a5a1ba",
"assets/LICENSE": "48532b66533cf40adffa9c0a3ba6b6d0",
"assets/images/ic_google.png": "8d61a1ae36dbd9d82305eab43cdb07fa",
"assets/images/android_audio_ac.png": "36bee86f647ba41089c21660924b5fc7",
"assets/images/ic_linkedIn.png": "5b5479e865a403692971bdf905e09998",
"assets/images/android_ac.png": "48b4810498dc335d984bfa565660982c",
"assets/images/mage.jpg": "43d2b9a60e31cf1a87784512bd9fa143",
"assets/images/ic_dribbble.png": "ab2d08e303c4d0ee5467e4c272fdfd8b",
"assets/images/ic_evernote.png": "19de46a5b8348420d099e78fde665955",
"assets/images/ibaozi.png": "9e851ce086383c49450f723af9385289",
"assets/images/portfolio_4.png": "003317c2fe56a6997fc2ed2e6f6ecfa8",
"assets/images/01.jpg": "f5c0526d68ce1079fb161612348c319b",
"assets/images/02.jpg": "2fcf7afc5853b3ba7ed0c2fa77146514",
"assets/images/gmail.png": "4830c5e0b5bbbe1c1e24d18ad860489b",
"assets/images/portfolio_2.png": "706cd1dbcbe600b8400075e7a93e5349",
"assets/images/portfolio_3.png": "067050f6ecc418ea7a7d2f3557683c8c",
"assets/images/portfolio_1.png": "e19ea0216ae8395bd4b3389970928be9",
"assets/images/ic_twitter.png": "83651994320dc0d3c7ad896ad058bb53",
"assets/images/weixin.png": "1858658fb9968a94815473a8a8d33c09",
"assets/images/avatar_xiaozhang.jpg": "2ea2deae87e2a74745a35fe6d3ad6e9b",
"assets/images/avatar.jpg": "e0cc713df0c6c0e300b79c8cc66627d2",
"assets/images/android-ac.png": "48b4810498dc335d984bfa565660982c",
"assets/images/feed/feed1_avatar2.png": "f5920002e116c6e799245810a956357f",
"assets/images/feed/feed1_avatar1.png": "b88ed01e9fab9d233d7a3f20e5dbcc1c",
"assets/images/feed/landscape.png": "4026b2ae05bad7f760083ff77c503c05",
"assets/images/feed/city.png": "80ca34ac2568215fa541632835a1a1da",
"assets/images/feed/feed13_pic3.png": "644aef98fb5093876ec45f2e88d7fa1b",
"assets/images/feed/feed12_pic2.png": "5c2537de59da4d649cbbd96556e9d0df",
"assets/images/feed/feed13_pic2.png": "5bb9fea1f194d4cad46aca41f7d42e68",
"assets/images/feed/feed13_pic1.png": "1db90f7f4eb1a10d9d1c423e54ab8f52",
"assets/images/feed/feed12_pic1.png": "7edf7076ee57758da6e4f86bf4438787",
"assets/images/feed/feed12_header.png": "02a87b2b5465525fc2cbd3bbdc174016",
"assets/images/feed/feed13_pic4.png": "22f0f1a24acf9b93570059b67c24f907",
"assets/images/feed/feed2_avatar2.png": "f8a3e8f6aa21eea5254d43b7c6a9ed21",
"assets/images/feed/heart.png": "fdfb38ed5dc77c027e5874fc348e1a75",
"assets/images/feed/feed_pic3_header_02.jpg": "dc6c96a3d05679ceea917681373bf4a0",
"assets/images/feed/feed_pic3_header_03.jpg": "345691ba036e660b9733f28280344a9e",
"assets/images/feed/feed11-header.png": "572bf7a511af625a42eca81c07d750a5",
"assets/images/feed/feed_pic3_header_01.jpg": "555a975e0209a5b91bf129f253c02405",
"assets/images/feed/feed_search.png": "87848b3c291b930fffe05255c886d27f",
"assets/images/feed/feed_pic3_left.jpg": "5df9999ec17df867c921bdd1d10d351b",
"assets/images/feed/feed_pic5_01.jpg": "3af8350db06f023a55baae51c76ee4d3",
"assets/images/feed/white_background.png": "bb26ab94855b10bfb78f91cb8912a3c4",
"assets/images/feed/ic_launcher.png": "65e09cbdbcbff4056e924b83ed2f99b0",
"assets/images/feed/feed2_image2.png": "025e4b7bf80fadd2a7663587506f629d",
"assets/images/feed/feed_pic3_01.jpg": "c73be0e1d1e48314ccdc81d4adf9acca",
"assets/images/feed/feed_pic3_03.jpg": "ba389c384bf68f942d729b70578acffd",
"assets/images/feed/feed2_image1.png": "11e5c2b2e6d0115ebf74c03faeca2f15",
"assets/images/feed/feed12_plus.png": "ebe426ec1ff085a33cba3d9643aaf5be",
"assets/images/feed/shop_river.png": "5d7eddb0436a3c0792c5f23dd90e14ff",
"assets/images/feed/feed_pic3_02.jpg": "8798fa6e738ac6f500562f4f17e97f88",
"assets/images/feed/menonglass.png": "b57af20605cd179bd92d199888e92faa",
"assets/images/feed/night.png": "c34cdd11883d6be87dbe4e00998d9ea2",
"assets/images/feed/feed13_header1.png": "302f99318a0149aa67db5a4d002e6ed3",
"assets/images/feed/feed11-city1.png": "0fa76f570c5e2b4219aef6f8be578a8b",
"assets/images/feed/feed_add.png": "da9a9d5e0da7cf3e0987d90c1b3adb9c",
"assets/images/feed/feed13_header2.png": "1077c83cdf72524ff1224c47c8ed149a",
"assets/images/feed/feed11-city2.png": "d92071c8cf0b801550ec779338fd484d",
"assets/images/feed/feed13_header3.png": "7ee72817dc2eb2ba7397326d5f8c2678",
"assets/images/feed/feed_more.png": "7d4dff163a3f9c6bc3f145b1e2a20aee",
"assets/images/ic_launcher.png": "1188b9817188b89f806fd3b38d015a61",
"assets/images/QQ.png": "3930bb6644debc209eb5e3d6020b0fa6",
"assets/images/jianshu.png": "3d6bcefeb8996383c27d47a9b9c46f3b",
"assets/images/tx.png": "3930bb6644debc209eb5e3d6020b0fa6",
"assets/images/programer.gif": "ec597d6f10e80f50529bd112e598577d",
"assets/AssetManifest.json": "36a16cbf3ff2d21c93465fee218792a1",
"assets/FontManifest.json": "7f770c1c1e562cddf60f64b88dc5d042",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/flutter_markdown/assets/logo.png": "67642a0b80f3d50277c44cde8f450e50",
"assets/fonts/icons.ttf": "509c16c917dca1db60f3c470d1b16028",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/fonts/montserrat/Montserrat-LightItalic.ttf": "428b2306e9c7444556058c70822d7d7c",
"assets/fonts/montserrat/Montserrat-Medium.ttf": "a98626e1aef6ceba5dfc1ee7112e235a",
"assets/fonts/montserrat/Montserrat-BoldItalic.ttf": "781190aecb862fffe858d42b124658cc",
"assets/fonts/montserrat/Montserrat-Light.ttf": "100b38fa184634fc89bd07a84453992c",
"assets/fonts/montserrat/Montserrat-ThinItalic.ttf": "3cb621135b5f6fe15d7c2eba68f0ee37",
"assets/fonts/montserrat/Montserrat-ExtraLight.ttf": "38bc5e073a0692a4eddd8e61c821d57a",
"assets/fonts/montserrat/Montserrat-Thin.ttf": "0052573bbf05658a18ba557303123533",
"assets/fonts/montserrat/Montserrat-Bold.ttf": "88932dadc42e1bba93b21a76de60ef7a",
"assets/fonts/montserrat/Montserrat-MediumItalic.ttf": "287208c81e03eaf08da630e1b04d80e8",
"assets/fonts/montserrat/Montserrat-BlackItalic.ttf": "b5331c5f5aae974d18747a94659ed002",
"assets/fonts/montserrat/Montserrat-SemiBold.ttf": "c88cecbffad6d8e731fd95de49561ebd",
"assets/fonts/montserrat/Montserrat-ExtraLightItalic.ttf": "6885cd4955ecc64975a122c3718976c1",
"assets/fonts/montserrat/Montserrat-ExtraBold.ttf": "9bc77c3bca968c7490de95d1532d0e87",
"assets/fonts/montserrat/OFL.txt": "5da468cc0e208e63aa009460017f214a",
"assets/fonts/montserrat/Montserrat-Black.ttf": "6d1796a9f798ced8961baf3c79f894b6",
"assets/fonts/montserrat/Montserrat-Regular.ttf": "9c46095118380d38f12e67c916b427f9",
"assets/fonts/montserrat/Montserrat-Italic.ttf": "6786546363c0261228fd66d68bbf27e9",
"assets/fonts/montserrat/Montserrat-SemiBoldItalic.ttf": "2d3cef91fbb6377e40398891b90d29bf",
"assets/fonts/montserrat/Montserrat-ExtraBoldItalic.ttf": "09a2d2564ea85d25a3b3a7903159927b"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
