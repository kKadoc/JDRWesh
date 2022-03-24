'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2694f71f381b05c97600feb41cb284f7",
"assets/assets/artworks/alarian1.jpg": "2ff035dff04d1633736acfdaafcd8ddb",
"assets/assets/artworks/alarian2.png": "55a6642850f0126920ee6ebd19dbe1cd",
"assets/assets/artworks/alarian3.png": "11a16d71a1546d9ebc5ec45d859e1ba0",
"assets/assets/artworks/alarian4.png": "b66cb39f233f7cd6ad1a01c2a7f36d4d",
"assets/assets/artworks/alarian5.png": "889197787f39d2149cc90571505f07aa",
"assets/assets/artworks/alarian6.png": "d60ac7ca2a5315a9a029390a4a43054e",
"assets/assets/artworks/alarian7.png": "96024513f7f04dc34d6491bae4f35e2a",
"assets/assets/artworks/alarian8.png": "4afd03b9c58ee8908537beefc0d4c3c3",
"assets/assets/artworks/hildorien1.jpg": "7c0cac72378ea54e6057ff9a5e9df863",
"assets/assets/artworks/hildorien10.jpg": "e17fb003ba064f1c8a5a6893daf96896",
"assets/assets/artworks/hildorien11.jpg": "c02b792549e9bf7c14a1d87f993f7021",
"assets/assets/artworks/hildorien12.jpg": "32f613f16a34a8c2989153eba7fd1602",
"assets/assets/artworks/hildorien13.jpg": "863ae54be1c29842532c72a82d0041ec",
"assets/assets/artworks/hildorien14.jpg": "d54f1a7385233c3ed924f89ab52d2073",
"assets/assets/artworks/hildorien15.jpg": "c4d4157bc96c01c13de9474781bbee5e",
"assets/assets/artworks/hildorien16.jpg": "bca42f64104ece021b22f48d39efa085",
"assets/assets/artworks/hildorien17.jpg": "17a85d478d757ea48a44ee159bf289a2",
"assets/assets/artworks/hildorien18.jpg": "b5e2fa3ae3b0c7a92f1b27db7576ae09",
"assets/assets/artworks/hildorien19.jpg": "1024cc9881a559b268fccb657a82ff9d",
"assets/assets/artworks/hildorien2.jpg": "58962760ec8638321100d7d6b8012fa6",
"assets/assets/artworks/hildorien3.jpg": "22682dd35301ac285b954ea6b4c7440c",
"assets/assets/artworks/hildorien4.jpg": "15a4159acb3dc0c9b405d98a60930ca9",
"assets/assets/artworks/hildorien5.jpg": "db01bcc649230d748a7a0c4b6af2bc5a",
"assets/assets/artworks/hildorien6.jpg": "a12dd6a50113ea9d6a0a00ff842606e4",
"assets/assets/artworks/hildorien7.jpg": "cbc7ef251b55496c3f6f9c2937d38a25",
"assets/assets/artworks/hildorien8.jpg": "4c51ac2bfe8fa046f79f483095254d72",
"assets/assets/artworks/hildorien9.jpg": "a2c8bf8bfba6cd690ad0284290d1382d",
"assets/assets/artworks/pacome1.jpg": "996e5f7245a62043dea0d0d6e326fdb7",
"assets/assets/artworks/pacome2.jpg": "f8759473f13dbf17bf53d821912f0756",
"assets/assets/artworks/pacome3.jpg": "b43a5709caf59127066a4f1d70b80c3e",
"assets/assets/artworks/pacome4.jpg": "21d8e36adcd129be9466d8f7153de5f2",
"assets/assets/artworks/pacome5.jpg": "ccc8f3e30fa2eef362243c32175ac117",
"assets/assets/artworks/pacome6.png": "a7540ecbd347d70a5d46643cd970d71e",
"assets/assets/artworks/pelerinage1.jpg": "30798085eb0e96b92d5b47fa0e1a442e",
"assets/assets/artworks/surveillance1.jpg": "7bfc5006a283f0eb34e4d99a16ef7fb3",
"assets/assets/artworks/surveillance2.jpg": "5dd889c4ab2632ce860d706b827bbeb6",
"assets/assets/artworks/tymora1.jpg": "50767811a3ed1d720d7702e2b44033bb",
"assets/assets/artworks/tymora2.PNG": "6798ecdb66a59c220859dabee9116c4d",
"assets/assets/artworks/tymora3.webp": "ced10b8974fa05eb4881c518f7a1dfd1",
"assets/assets/artworks/tymora4.jpg": "9660005be287ab62a9d8467e1322ea84",
"assets/assets/artworks/tymora5.webp": "d516737013cde464c9a458bc4bd6ceb6",
"assets/assets/artworks/tymora6.jpeg": "3c948de40629a736aa4a74481630c318",
"assets/assets/artworks/tymora7.jpg": "65516f0110c97086473d79a43c145348",
"assets/assets/artworks/tymora8.webp": "98412dec1e242b4b0c6c7c18e9ce32c9",
"assets/assets/artworks/waterdeep1.jpg": "b419284ca2d5b65ec0d8c663a2695919",
"assets/assets/artworks/waterdeep10.PNG": "8e36f292eb918cda9b17f1ffbe656979",
"assets/assets/artworks/waterdeep11.png": "155c9150cab501787b5c4458651c984a",
"assets/assets/artworks/waterdeep12.png": "b62a4f70ec9955c56e83a85d1b201964",
"assets/assets/artworks/waterdeep13.jpg": "3f76eb64cbf8e34370f4bd56681330c1",
"assets/assets/artworks/waterdeep2.webp": "f598d904e0ab94a95d0fc4ccf6d97c45",
"assets/assets/artworks/waterdeep3.webp": "33c0f266bc4957eff2e893d7086f4928",
"assets/assets/artworks/waterdeep4.webp": "972b37d0698d8e438ed6296ccd121164",
"assets/assets/artworks/waterdeep5.jpg": "042c9775bf426b0b5f87de18568928f7",
"assets/assets/artworks/waterdeep6.jpg": "497f233037abc417f9fbe1060caf56fb",
"assets/assets/artworks/waterdeep7.png": "a3bb73f56d5d12c1659bd261b26a7ddc",
"assets/assets/artworks/waterdeep8.png": "909a4b399c034881a2a20ab665996540",
"assets/assets/artworks/waterdeep9.jpg": "3e0feaddc3fad31e34c66c0cd277de69",
"assets/assets/data/defaite.png": "1266d17b07fd3b490d88be77d9a3d3bc",
"assets/assets/data/encours.png": "f773f868263a7793d4c8661b189cb9fc",
"assets/assets/data/victoire.png": "e6535efe33855613f6250397a22690de",
"assets/assets/data.json": "75ffb74e8499920bcefd3f0b00bd0c36",
"assets/assets/logos/adalon.png": "1f6d4b9bf81d325744cd734993f79c8b",
"assets/assets/logos/dd3.png": "d0f113d75bc9f55f919ffa8027b4b727",
"assets/assets/logos/dd4.png": "68ca62d822edcb3ed913d5b6e5807894",
"assets/assets/logos/dd5.png": "0b5b827fecf06d90f37fdc817fd52ddc",
"assets/assets/logos/faements.png": "31107ca50929b3033f9d3d56dd0c251e",
"assets/assets/logos/sw.png": "b45d2f73337c918bd225dc855372110a",
"assets/assets/logos/swcommando.png": "307b936cda18db9917c605176ff31bcd",
"assets/assets/players/0.jpg": "1eda61a4e90e5d2851f644ed0b1b0f16",
"assets/assets/players/Adrik.jpg": "bb95afd06ad5df934f6a414a4ac29e7d",
"assets/assets/players/Amras.jpg": "020eee2ee59aca14caef39005743e9b6",
"assets/assets/players/Angus.png": "889197787f39d2149cc90571505f07aa",
"assets/assets/players/Anjalbert.jpg": "8ec7d520407c19785d773021eafbfcbf",
"assets/assets/players/Aurinax.jpg": "e586dd730e80a071e0bf417a6188eb88",
"assets/assets/players/Bastian.jpg": "ff83c7782382a922d5ec97a52cfe3f05",
"assets/assets/players/beholder-zombie.jpg": "5dd889c4ab2632ce860d706b827bbeb6",
"assets/assets/players/Belwar.png": "5f91b18261dcccbf93b74949978dfa05",
"assets/assets/players/Charon.png": "0c895ee66058e88dc78da25ae4b6be32",
"assets/assets/players/Conrad.jpg": "b538b285884d741df9bfc761404cd435",
"assets/assets/players/Conrad_pacome.jpg": "21d8e36adcd129be9466d8f7153de5f2",
"assets/assets/players/Durcom.png": "bea9c451515b2a785f4143d8826fcd46",
"assets/assets/players/Elendur.jpg": "2cfde9061b922904d7cb8a0f905e5b6d",
"assets/assets/players/Flora.jpg": "fab520f3d40e7e1a07f572fe14070447",
"assets/assets/players/Flutovand.jpg": "1188d5ae251bbcd5e9e2d9a192f4b29a",
"assets/assets/players/Fran%25C3%25A7ois.jpg": "4a379409e10eccecdf033ef61b2e45b7",
"assets/assets/players/Gaelan.png": "5c990abe32a5f3e8aaa78f1640fc54e5",
"assets/assets/players/Golem.webp": "113fa1102b9d8b14be21e4545362df3f",
"assets/assets/players/Guillaume.jpg": "fc77769f7a2a9fff5dac9891dba1dd90",
"assets/assets/players/Gutz.jpg": "cc84991ff26ae25fd6acb3d69727ad8a",
"assets/assets/players/Hurminn.jpg": "1d370c695b8b0f1ac829abbb2767403b",
"assets/assets/players/JC.jpg": "bfe4d297982548aeee295686d4f62a7a",
"assets/assets/players/Lyanna.png": "149fad61118a1f0c58e7168f35a46d4a",
"assets/assets/players/Marna.jpg": "8ac9d39f2d378e007bc19fa81940044f",
"assets/assets/players/Matthieu.jpg": "3058f4aa53c6d412f3665ff75b5b24d3",
"assets/assets/players/Raerthus.jpg": "6ab65cfb56c783d4fb4bfd8316f0f9d9",
"assets/assets/players/Sarah.jpg": "9616c4301ee13d1161ff8ea314bae256",
"assets/assets/players/Thoradin.png": "23b30b3446e084f46154eeafc98a8aab",
"assets/assets/players/Velsharoon.webp": "98412dec1e242b4b0c6c7c18e9ce32c9",
"assets/assets/players/wolf.jpg": "3353f04fb91700480b5e4f8c9d05bc31",
"assets/docs/assets/assets/data.json": "75ffb74e8499920bcefd3f0b00bd0c36",
"assets/docs/assets/docs/assets/assets/data.json": "75ffb74e8499920bcefd3f0b00bd0c36",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "619d05f751c1b65b852262fc85fee97e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "bb85d4856881a47cfedb40c98b23f682",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cb3adc45087f4dd1b50f578396bea562",
"/": "cb3adc45087f4dd1b50f578396bea562",
"main.dart.js": "a57c29e222ade959c76405898642f59a",
"manifest.json": "f1147b4a86e0f671afeefb602cfac349",
"version.json": "4e3b24a8653a4b768d22848b7274f9b5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
