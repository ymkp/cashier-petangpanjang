// ? ---------------------------------------------start of MEMBER

const String _member = '/member';

const String memberGetActive = '$_member/active';

/// POST
const String memberCreateNew = '$_member/new';

/// POST
const String memberSearchMemberNo = '$_member/search/memberNo';

/// POST
const String memberSearchCardNo = '$_member/search/cardNo';

// ? ---------------------------------------------end of MEMBER

// ? ---------------------------------------------start of ITEM
const String _item = '/item';

/// GET
const String itemGetAllCategory = '$_item/category';

/// GET $_item/menu/category/all
const String itemGetCategoriesAndMenus = '$_item/menu/category/all';

/// GET $_item/menu/category/id
const String itemGetMenuByCategory = '$_item/menu/category/';
// ? ---------------------------------------------end of ITEM

// ? ---------------------------------------------start of TRANSACTION
const String _transaction = '/transaction';

/// POST
const String transactionCreate = '$_transaction/new';

/// GET
const String transactionGetALl = '$_transaction/all';

/// GET
const String transactionGetMembers = '$_transaction/member/';

/// PATCH
const String transactionEdit = '$_transaction/edit';

/// PATCH
const String transactionEditMember = '$_transaction/edit/member';

// ? ---------------------------------------------end of TRANSACTION
