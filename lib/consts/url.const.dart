// ? ---------------------------------------------start of MEMBER

const String _member = '/member';

/// GET
const String memberGetActive = '$_member/members/active';

/// GET
const String memberGetCompleted = '$_member/members/completed';

/// GET
const String memberGetAvailableCards = '$_member/card/available';

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

/// POST
const String transactionPay = '$_transaction/pay';

/// GET
const String transactionGetALl = '$_transaction/all';

/// GET
const String transactionGetMembers = '$_transaction/member/';

/// GET '$_transaction/member-complete/":cardNo'
const String transactionCompleteGetMemberWithCardNo =
    '$_transaction/member-complete/';

const String transactionCompleteGetMemberWithMemberId =
    '$_transaction/member-complete-id/';

/// PATCH
const String transactionEdit = '$_transaction/edit';

/// PATCH
const String transactionEditMember = '$_transaction/edit/member';

// ? ---------------------------------------------end of TRANSACTION
