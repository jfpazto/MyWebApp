'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".firebase/hosting.YnVpbGRcd2Vi.cache": "460cd9295bb5344bb124c7699c20d3e1",
".git/COMMIT_EDITMSG": "b4a06795a534ab50aa131c5b9d65b20a",
".git/config": "49967f13d7c07392a23cc64aced9b017",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "07be5e383f2103080b76f993173f7136",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "c78184fd2a9a8f91801c727d9575d983",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "5457170def50c04b2ebb8b5b173e1d25",
".git/logs/refs/heads/main": "5efbc51b7d9c330be82d7b1cfbb8ca60",
".git/logs/refs/remotes/origin/main": "6fcdafc76c9b6a72017d9ae76f644ca4",
".git/objects/03/ffe4b35ab04d4d2dbe7331bbb1e9d8d3e69159": "7b25f66964c357e0c035fded088fed16",
".git/objects/06/87be39006adeccc8d22d7bdfaeeb6ef9b6e164": "6a0f3e9db6bcf811996682026fa0370f",
".git/objects/0c/bfc7de54268c12f379958180c171fa7bda3f66": "b7ec9fa05fa83a5cc5b6803003309f4d",
".git/objects/12/5c284dc2bbed823ed6389e50cc75a8a1ef2351": "9ab0bcea773dc4fd6ef989aef459b28a",
".git/objects/17/83ab9687f1cd57d01e44fb9def2aed0f2e3e79": "892ce17d4776c26d4c90f972d62e207d",
".git/objects/1a/844a8ff6e9d110c580653cbe7180c26ebcaec0": "c2d7ac061dd45e524c7183346a8d5060",
".git/objects/1d/ef4488b9a6465682aa84b6fb75ccf7b8e98d41": "975c6212a6ace2d8414519423f4fa686",
".git/objects/1f/8f7eb658ad3653009610141ba4615ea984f07a": "82ee15c139405090b78c5a37021d7e1c",
".git/objects/24/13d1da5835bb5581242ced761491ba5a0561ba": "668408c28cfd12bea0cace479fba4faa",
".git/objects/31/ff2de23ab3e3fc4464525859d2b8d3d0e65ad8": "aae6208e78e4d1d071b55a539ef0cad2",
".git/objects/37/7ead7488ba04497de54363ee4e4436edf85774": "d08a584d3f7b4fb2a65c159d695456ff",
".git/objects/41/5c059c8094b888b0159fdedfd4e3cb08a8028e": "86914685ccd40e82a7fe5b70459fb9f7",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4b/ce11f832f26ee264d95b6790237601cf5a6088": "d9243641979aa81a886b057ab392745a",
".git/objects/55/919b0b32f21410d9755ffbe64aeb2d07650744": "ffb88073b04c5f9454f1e7f08edc733c",
".git/objects/59/c82b8d97b6ce17e4ffbe7342590354495b2de9": "56cf970b3a0be31704944bd3bb8daaf1",
".git/objects/60/b14bb9b3f5c38623ca5d4600bde3db189391c5": "88378d7cb27f48eb1a96700f821fe5a8",
".git/objects/62/1f01acd69cc67a7a3ff5d729e3fd5e2d0427bc": "a661860331d5594e75f226ddcf40ddfb",
".git/objects/66/037326c171ff15c5c73bb30860864ed8381291": "7e019f3d11a5dfd956970811a0d13ecb",
".git/objects/6a/562868741911ffc3a5345f3c094a71eb0d073d": "ad3237b80e6dc65be0e2000c6c0a445f",
".git/objects/6c/6e475d6d37266b2b9ded3bd9170728273514e9": "88b7da7b31113feee169ba4fb170039e",
".git/objects/73/a5ca9e6ea457a8e87e3e88047b9268f15bb75b": "437e873491b95548ba60fecc00fa7933",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/81/e6fcd16a7e455bcf2705160edeee700c88400f": "e51b66e2842dabd746f99174d21f9af2",
".git/objects/84/b82038500bbc13470c702ba1faa9ef22cb353f": "91692b81377056ab7df1e52729a929d3",
".git/objects/84/ea085d2c033512edb6d0cc004db6f8d7ca66c9": "5d86fafb760d4557d94835e19e4adbf0",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/99266130a89547b4344f47e08aacad473b14e0": "41375232ceba14f47b99f9d83708cb79",
".git/objects/93/d444f787d89abdc0a2ff7b9a2943fe6010dbad": "9d9916ec1cb99eb525c2c0cc942aca71",
".git/objects/9c/9de182eb043cfd3fe5582ae016121c9c6df1e6": "69c4dad2ab50934e5140720a73daeb14",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a5/4e84eeebe28864607065842322b3b73be10ab3": "c58f09927e034e3efb9f73e265754cd9",
".git/objects/aa/f9775aa89c03137dbf48721cdc05191703de5e": "25802b31f0bee36b4e1a7a67835f99f0",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/ab/fa53daac84fdcd9e4da9d6c55a147982e89462": "b8fb3b4779edb70083ee5010c98c4366",
".git/objects/b1/7f6310755422d220e2c975ca4387ab465c95a0": "bfade2f38068d533f45c1eda0e60dd92",
".git/objects/b5/2417020c09dd1c311809b1d6a6cd18d67b38e9": "d1451fad48fb2225ecf11b69acd24cd4",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bd/0d2da04eec18767d429055927d585ca343f5b1": "49ecd3a8125d7e356d9d6390b5c2c6b1",
".git/objects/c0/1d399322869e8d48185e360d95e7fcd5a2e893": "ac937b515941bfbca76e0c164cf76aba",
".git/objects/cc/e5e5ce658c8cf68913581116905a6df97007c3": "080d008c88a12d15addf507f9bcd22bc",
".git/objects/d1/ab292864e95ed5f89aadcdc66243327880a36e": "429c09fb3662b2014f6982a6264b66bb",
".git/objects/d4/f89150af6a7c88a0fc506538156954e7bfbb6c": "8542b4d23530398036fb0ba3bb0f545d",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/53755e21cec025587318004532f0135c4cfdd0": "654358506ce65a55070e591293e526b7",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e6/db55a721f2ffaa9b19ed28024511c1708fe12b": "076aab75e00a7b88b96b42147d0eadee",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/5a04c5ea811df07f050ea505f4489de9f814f6": "8c949ed5bb52a7388263390ed5fbae13",
".git/objects/f8/9a68b45b9d293f69010ced0e4560a760846d67": "006ae0ad9b1bdbd57f9f87b16d3a855f",
".git/refs/heads/main": "6e77704471182e2db7c764ba4e290e51",
".git/refs/remotes/origin/main": "6e77704471182e2db7c764ba4e290e51",
".github/workflows/firebase-hosting-merge.yml": "7c8566589dd41da9aaa821938ef4f63f",
".github/workflows/firebase-hosting-pull-request.yml": "5f10becdc0b7291a4d64a84e5f1bdfc0",
"assets/AssetManifest.json": "5224db365d56cd5267a1eaf77a9d77b6",
"assets/assets/images/Icon.png": "f7743a27a6c15e3f4351aeb518f85c7f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "0f847a28281c40493bbb7fbb39a267d5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"build/web/index.html": "6f0e6521089f4b34ee42559d403c2313",
"/": "c341f04d08307f6959ee0373df8edb15",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"firebase.json": "18500ee9b0fa2255ec701badcc73425d",
"flutter.js": "f916451a1f92b11ff8e28c4f8286d327",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c341f04d08307f6959ee0373df8edb15",
"main.dart.js": "eb81341e2bcbde207c26156fe36639c2",
"manifest.json": "d6ca57350173b3ccd7074f958253fbee",
"version.json": "c8f979d408e51acd1ee06f6af9b9722c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
