importScripts('https://www.gstatic.com/firebasejs/9.24.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.24.0/firebase-messaging-compat.js');
importScripts('/firebase/firebase-app-compat.js');
importScripts('/firebase/firebase-messaging-compat.js');


// Firebase configuration
const firebaseConfig = {
     apiKey: "AIzaSyBItwB7aeJDMFlHHOWTG7GrWiBVJawLJ2A",
     authDomain: "movie-app-f2dc7.firebaseapp.com",
     projectId: "movie-app-f2dc7",
     storageBucket: "movie-app-f2dc7.firebasestorage.app",
     messagingSenderId: "250689335369",
     appId: "1:250689335369:web:1638d07354b57160968f98",
     measurementId: "G-TBGPN1XL2R"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

// Initialize Firebase Messaging
const messaging = firebase.messaging();

messaging.onBackgroundMessage(function(payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
        icon: '/icon.png', // Replace with your app's icon path
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});
