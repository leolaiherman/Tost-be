import prisma from "./prisma";

async function main() {
    const history = await prisma.menu.create({
        data: {
            menuName: "McBandung",
            menuPrice: 700,
            menuDescription: "fiesta chicken nugget",
        }
    })

    const user = await prisma.user.create({
        data: {
            userName: "John",
            userEmail: "John@example.com",
            userPassword: "password",
            role: "ADMIN"
        }
    })

    console.log(history)
    console.log(user)
}


main()
    .catch(e => {console.error(e.message)})
    .finally(async () => {await prisma.$disconnect()})