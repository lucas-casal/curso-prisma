import prisma from "./database/database";

(async () => {
  const result = await prisma.posts.findMany()

  const posts = result;
  console.log("Posts encontrados no banco:", posts);
})();