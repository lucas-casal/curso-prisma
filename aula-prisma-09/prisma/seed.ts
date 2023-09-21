import prisma from "../src/database/database"
const customer = {
    firstName:'Geraldo Luiz',
    lastName: 'Datena',
    document: '133.245.497-60'
}
async function main(){
    return await prisma.customer.upsert({
        create: customer, 
        update: {},
        where: {
            document: '133.245.497-60'
        }
    })
}

main().then(async () =>{
    await prisma.$disconnect();
    console.log('o seguinte usuário foi criado: ')
    console.log(customer)
}). catch(async (e) =>{
    console.error(e)
    await prisma.$disconnect();
    process.exit(1);
})