"use server"

import {createUser} from '../../lib/users'

export async function createUserAction(name: string, email: string, password: string) {
    await createUser(name, email, password);
}