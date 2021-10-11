String communitiesQuery = """
query getCommunities{
  getCommunities{
    id
    name
    logo
    category{
      id
      name
    }
    description
    owners{
      id
      name
      profile{
        id
        quote
        username
        photo
      }
    }
    members{
      id
      name
      profile{
        id
        quote
        username
        photo
      }
    }
  }
}
""";

String communityQuery = """
query getCommunity(\$id: String!){
  getCommunity(id: \$id){
    id
    name
    logo
    category{
      id
      name
    }
    description
    owners{
      id
      name
      profile{
        id
        quote
        username
        photo
      }
    }
    members{
      id
      name
      profile{
        id
        quote
        username
        photo
      }
    }
  }
}
""";

String deleteMemberGroup = """
  mutation leaveCommunity(\$communityId: String!){
    leaveCommunity(communityId: \$communityId){
      message
    }
  }
""";
