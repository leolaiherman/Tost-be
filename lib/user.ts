import prisma from "./prisma";

async function main() {
const user = await prisma.orderHistory.create({ data : { uID : 1, userEmail : "user@prisma.com"}})
  console.log(user)
}

main()
  .catch(e => {console.error(e.message)})
  .finally(async () => {await prisma.$disconnect()})
