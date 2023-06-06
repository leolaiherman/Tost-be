import {getUsers} from "../../../../lib/users"

const page = async () => {

    const {users} = await getUsers()

    var usr = users?.map(user => {user.userID})

    async function action (data: FormData) {
        const name = data.get('name')
    }

    return (
        <section className='py-20'>

            <div className='container'>
                <h1>Users</h1>
                
                <h2>A user :</h2>

                <ul>
                    {users?.map(user => (<li key={user.userID}>{user.userName} {user.role} {user.userPassword}</li>))}
                </ul>
            </div>
        </section>
    )
};

export default page;