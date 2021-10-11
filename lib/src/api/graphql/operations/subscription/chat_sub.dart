String chatSub = """
subscription getNewMessages(\$chatId: String!){
  getNewMessages(chatId: \$chatId){
    data{
			id
		  text
		  me
		  read
		  picture
			sender{
				id
				name
				email
			}
			createdAt
			updatedAt
		}
		message
  }
}
""";
