db.createUser({
  user: 'my_username',
  pwd: 'my_password',
  roles: [
    {
      role: 'dbOwner',
      db: 'my_database',
    },
  ],
});

db.createCollection('users');
db.createCollection('blogs');
db.createCollection('comments');

db.users.insert({ username: "user1", name: "one", password: "passuser1" });
db.users.insert({ username: "user2", name: "two", password: "passuser2" });
// NOTE: --> ko dc bcrypt

// (Ko có id user, nên ra web cũng chán à)
// db.blogs.insert({ title: "Winter in Finland", author: "Henry Fo", url: "hihihaha.com", likes: 8 });
// db.blogs.insert({ title: "Fog village", author: "Han Solo", url: "hihihaha.com", likes: 8 });
// db.blogs.insert({ title: "Aurora", author: "Peter Pan", url: "hihihaha.com", likes: 8 });

