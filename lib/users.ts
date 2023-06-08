import prisma from "./prisma";

export async function getUsers() {
  try {
    const users = await prisma.user.findMany();
    return { users };
  } catch (error) {
    return { error };
  }
}

export async function getMenu() {
  try {
    const oH = await prisma.menu.findMany();
    return { oH };
  } catch (error) {
    return { error };
  }
}

