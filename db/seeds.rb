User.create!(
  name: "Faust Bubba",
  email: "faust@example.com",
  password: "foostabubba",
  password_confirmation: "foostabubba"
)

Recipe.create!(
  name: "Pasta with Tomato Sauce",
  description: "A classic Italian pasta dish with a homemade tomato sauce.",
  difficulty: "beginner",
  favorite: true,
  author_id: 1
)

Recipe.create!(
  name: "Roasted Chicken with Vegetables",
  description: "Juicy roasted chicken served with a side of seasonal vegetables.",
  difficulty: "advanced",
  favorite: false,
  author_id: 1
)
Recipe.create!(
  name: "Chocolate Chip Cookies",
  description: "Classic chocolate chip cookies made from scratch with high-quality ingredients.",
  difficulty: "beginner",
  favorite: true,
  author_id: 1
)
Recipe.create!(
  name: "Beef Stroganoff",
  description: "A classic Russian dish with beef, mushrooms, onions, and a creamy sauce served over egg noodles.",
  difficulty: "intermediate",
  favorite: true,
  author_id: 1
)
Recipe.create!(
  name: "Grilled Lamb Chops",
  description: "Juicy and flavorful lamb chops seasoned with fresh herbs and grilled to perfection.",
  difficulty: "advanced",
  favorite: true,
  author_id: 1
)
Recipe.create!(
  name: "Beef Wellington",
  description: "A gourmet dish made with a beef filet, mushrooms, puff pastry, and a red wine reduction sauce.",
  difficulty: "expert",
  favorite: false,
  author_id: 1
)
