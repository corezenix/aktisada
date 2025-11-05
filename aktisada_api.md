**1. login

curl --location 'https://app.aktisada.com/api/v1/login' \
--header 'Accept: application/json' \
--form 'mobile="1234567899"' \
--form 'password="123456"'

**Response:
{
    "message": "Logged Successfully",
    "data": {
        "token": "178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2",
        "user": {
            "id": 1,
            "shop_name": "Shaji Enter prices",
            "contact_person": "shaji",
            "country_code": 91,
            "mobile": "1234567899",
            "user_mobile": "911234567899",
            "whatsapp_no": "1234567899",
            "email": "shaji@gmail.com",
            "role_id": 0,
            "address": "testing",
            "location": "karanthur",
            "city": "kunnamangalam",
            "district": "kozhikode",
            "state": "kerala",
            "pincode": null,
            "status": 1,
            "created_by": 0,
            "created_at": "2025-08-02T09:23:59.000000Z",
            "updated_at": "2025-08-02T09:23:59.000000Z"
        }
    },
    "status": true
}


**2. get-slides

curl --location 'https://app.aktisada.com/api/v1/get-slides' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2'

**Response:

{
    "message": "Slides Successfully listed",
    "slides": [
        {
            "pk_slide_id": 8,
            "image_file": "slides/ZvH5B-062646-cyc.png",
            "status": 1,
            "created_by": 1,
            "created_at": "2025-08-02T18:26:46.000000Z",
            "updated_at": "2025-08-02T18:38:09.000000Z",
            "image_path": "https://app.aktisada.com/uploads/slides/ZvH5B-062646-cyc.png"
        }
    ],
    "status": true
}


**3 get-categories

curl --location 'https://app.aktisada.com/api/v1/get-categories' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2'

** Response

{
    "message": "Category Successfully listed",
    "data": {
        "categories": [
            {
                "pk_category_id": 2,
                "category": "bbbbbbbbbbbbbb",
                "image_file": "category/261754118628.png",
                "status": 1,
                "created_by": 1,
                "created_at": "2025-08-02T05:57:34.000000Z",
                "updated_at": "2025-08-02T07:13:58.000000Z",
                "image_path": "https://app.aktisada.com/uploads/category/261754118628.png"
            },
            {
                "pk_category_id": 3,
                "category": "mmmmmmmm",
                "image_file": "category/441754118619.png",
                "status": 1,
                "created_by": 1,
                "created_at": "2025-08-02T05:57:43.000000Z",
                "updated_at": "2025-08-02T07:10:19.000000Z",
                "image_path": "https://app.aktisada.com/uploads/category/441754118619.png"
            }
        ]
    },
    "status": true
}


/*To get all items for add products and filter products*/

**4. get-brand-type-material:

curl --location 'https://app.aktisada.com/api/v1/get-brand-type-material' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 183|sRPxCtKEbL643U9XiUorxQkOMqeVr2sbpHJRpdB1292867df' \
--form 'category_id="1"'

**Response:

{
    "message": "Details Successfully listed",
    "data": {
        "brands": [
            {
                "pk_brand_id": 1,
                "brand_name": "bbbbbbbbbb",
                "created_at": "2025-08-02T19:23:17.000000Z",
                "updated_at": "2025-08-02T19:23:17.000000Z"
            },
            {
                "pk_brand_id": 2,
                "brand_name": "yyyyyyyyyyyy",
                "created_at": "2025-08-02T19:23:26.000000Z",
                "updated_at": "2025-08-02T19:23:26.000000Z"
            },
            {
                "pk_brand_id": 3,
                "brand_name": "wwwwwwwwwwwwwwwwwww",
                "created_at": "2025-08-02T19:23:30.000000Z",
                "updated_at": "2025-08-02T19:23:30.000000Z"
            },
            {
                "pk_brand_id": 4,
                "brand_name": "brand-1",
                "created_at": "2025-08-02T19:55:33.000000Z",
                "updated_at": "2025-08-02T19:55:33.000000Z"
            },
            {
                "pk_brand_id": 5,
                "brand_name": "Brand-2",
                "created_at": "2025-08-02T19:57:20.000000Z",
                "updated_at": "2025-08-02T19:57:20.000000Z"
            }
        ],
        "types": [
            {
                "pk_type_id": 1,
                "category_id": 1,
                "type_name": "mmmmmmmmmm",
                "created_at": "2025-08-02T19:49:25.000000Z",
                "updated_at": "2025-08-02T19:49:25.000000Z"
            },
            {
                "pk_type_id": 2,
                "category_id": 1,
                "type_name": "kkkkkkkkkkkk",
                "created_at": "2025-08-02T19:49:31.000000Z",
                "updated_at": "2025-08-02T19:49:31.000000Z"
            }
        ],
        "size": [
            {
                "pk_size_id": 1,
                "category_id": 1,
                "item_size": "bbbb1",
                "created_at": "2025-08-12T15:45:56.000000Z",
                "updated_at": "2025-08-12T15:45:56.000000Z"
            },
            {
                "pk_size_id": 5,
                "category_id": 1,
                "item_size": "qqqqqqq",
                "created_at": "2025-08-12T15:46:16.000000Z",
                "updated_at": "2025-08-12T15:46:16.000000Z"
            },
            {
                "pk_size_id": 6,
                "category_id": 1,
                "item_size": "wwwwwwwwww",
                "created_at": "2025-08-12T15:46:20.000000Z",
                "updated_at": "2025-08-12T15:46:20.000000Z"
            }
        ],
        "material": [
            {
                "pk_material_id": 1,
                "category_id": 1,
                "material_name": "mmmmmmmmmmmm",
                "created_at": "2025-08-02T19:53:50.000000Z",
                "updated_at": "2025-08-02T19:53:50.000000Z"
            }
        ],
        "shops": [
            {
                "pk_user_id": 2,
                "shop_name": "All kerala tiles and sanitarywares",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567898",
                "user_mobile": "911234567898",
                "whatsapp_no": "1234567898",
                "email": "shaji@gmail.com",
                "role_id": 2,
                "address": "testing",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 2,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-02T09:23:59.000000Z"
            },
            {
                "pk_user_id": 3,
                "shop_name": "test2",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567897",
                "user_mobile": "911234567897",
                "whatsapp_no": "1234567897",
                "email": "shaji@gmail.com",
                "role_id": 2,
                "address": "testing",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 2,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-02T09:23:59.000000Z"
            },
            {
                "pk_user_id": 4,
                "shop_name": "test3",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567896",
                "user_mobile": "911234567896",
                "whatsapp_no": "1234567896",
                "email": "shaji@gmail.com",
                "role_id": 2,
                "address": "testing  sdfsdfsdfsd",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 2,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-04T16:41:13.000000Z"
            },
            {
                "pk_user_id": 5,
                "shop_name": "ABC",
                "contact_person": "ASD",
                "country_code": 91,
                "mobile": "1234567888",
                "user_mobile": "911234567888",
                "whatsapp_no": "1234567888",
                "email": "abc@gmail.com",
                "role_id": 2,
                "address": "aaa",
                "location": "bbb",
                "city": "nnnn",
                "district": "www",
                "state": "kkkk",
                "pincode": null,
                "status": 1,
                "created_by": 1,
                "created_at": "2025-08-06T17:10:13.000000Z",
                "updated_at": "2025-08-06T17:10:13.000000Z"
            }
        ]
    },
    "status": true
}

**5. get-filters

curl --location 'https://app.aktisada.com/api/v1/get-filters' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 182|vg77tc2xaSmx5FjunbpfNwdu3dkwUN9hT7oh5dQccf96ceaf' \
--form 'category_id="1"'


**Response

{
    "message": "Details Successfully listed",
    "data": {
        "categories": [
            {
                "pk_category_id": 1,
                "category": "bbbbbbbbbbbbbb",
                "image_file": "category/261754118628.png",
                "status": 1,
                "created_by": 1,
                "created_at": "2025-08-02T05:57:34.000000Z",
                "updated_at": "2025-08-02T07:13:58.000000Z"
            },
            {
                "pk_category_id": 2,
                "category": "mmmmmmmm",
                "image_file": "category/441754118619.png",
                "status": 1,
                "created_by": 1,
                "created_at": "2025-08-02T05:57:43.000000Z",
                "updated_at": "2025-08-02T07:10:19.000000Z"
            }
        ],
        "brands": [
            {
                "pk_brand_id": 1,
                "brand_name": "bbbbbbbbbb",
                "created_at": "2025-08-02T19:23:17.000000Z",
                "updated_at": "2025-08-02T19:23:17.000000Z"
            },
            {
                "pk_brand_id": 2,
                "brand_name": "yyyyyyyyyyyy",
                "created_at": "2025-08-02T19:23:26.000000Z",
                "updated_at": "2025-08-02T19:23:26.000000Z"
            },
            {
                "pk_brand_id": 3,
                "brand_name": "wwwwwwwwwwwwwwwwwww",
                "created_at": "2025-08-02T19:23:30.000000Z",
                "updated_at": "2025-08-02T19:23:30.000000Z"
            },
            {
                "pk_brand_id": 4,
                "brand_name": "brand-1",
                "created_at": "2025-08-02T19:55:33.000000Z",
                "updated_at": "2025-08-02T19:55:33.000000Z"
            },
            {
                "pk_brand_id": 5,
                "brand_name": "Brand-2",
                "created_at": "2025-08-02T19:57:20.000000Z",
                "updated_at": "2025-08-02T19:57:20.000000Z"
            }
        ],
        "types": [
            {
                "pk_type_id": 1,
                "type_name": "mmmmmmmmmm",
                "created_at": "2025-08-02T19:49:25.000000Z",
                "updated_at": "2025-08-02T19:49:25.000000Z"
            },
            {
                "pk_type_id": 2,
                "type_name": "kkkkkkkkkkkk",
                "created_at": "2025-08-02T19:49:31.000000Z",
                "updated_at": "2025-08-02T19:49:31.000000Z"
            }
        ],
        "material": [
            {
                "pk_material_id": 1,
                "material_name": "mmmmmmmmmmmm",
                "created_at": "2025-08-02T19:53:50.000000Z",
                "updated_at": "2025-08-02T19:53:50.000000Z"
            }
        ],
        "shops": [
            {
                "pk_user_id": 2,
                "shop_name": "All kerala tiles and sanitarywares",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567898",
                "user_mobile": "911234567898",
                "whatsapp_no": "1234567898",
                "email": "shaji@gmail.com",
                "role_id": 2,
                "address": "testing",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 2,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-02T09:23:59.000000Z"
            },
            {
                "pk_user_id": 3,
                "shop_name": "test2",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567897",
                "user_mobile": "911234567897",
                "whatsapp_no": "1234567897",
                "email": "shaji@gmail.com",
                "role_id": 2,
                "address": "testing",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 2,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-02T09:23:59.000000Z"
            },
            {
                "pk_user_id": 4,
                "shop_name": "test3",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567896",
                "user_mobile": "911234567896",
                "whatsapp_no": "1234567896",
                "email": "shaji@gmail.com",
                "role_id": 2,
                "address": "testing  sdfsdfsdfsd",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 2,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-04T16:41:13.000000Z"
            },
            {
                "pk_user_id": 5,
                "shop_name": "ABC",
                "contact_person": "ASD",
                "country_code": 91,
                "mobile": "1234567888",
                "user_mobile": "911234567888",
                "whatsapp_no": "1234567888",
                "email": "abc@gmail.com",
                "role_id": 2,
                "address": "aaa",
                "location": "bbb",
                "city": "nnnn",
                "district": "www",
                "state": "kkkk",
                "pincode": null,
                "status": 1,
                "created_by": 1,
                "created_at": "2025-08-06T17:10:13.000000Z",
                "updated_at": "2025-08-06T17:10:13.000000Z"
            }
        ],
        "sizes": [
            {
                "pk_size_id": 1,
                "category_id": 1,
                "item_size": "bbbb1",
                "created_at": "2025-08-12T15:45:56.000000Z",
                "updated_at": "2025-08-12T15:45:56.000000Z"
            },
            {
                "pk_size_id": 5,
                "category_id": 1,
                "item_size": "qqqqqqq",
                "created_at": "2025-08-12T15:46:16.000000Z",
                "updated_at": "2025-08-12T15:46:16.000000Z"
            },
            {
                "pk_size_id": 6,
                "category_id": 1,
                "item_size": "wwwwwwwwww",
                "created_at": "2025-08-12T15:46:20.000000Z",
                "updated_at": "2025-08-12T15:46:20.000000Z"
            }
        ]
    },
    "status": true
}


**6. add-product

curl --location 'https://app.aktisada.com/api/v1/add-product' \
--header 'Accept: application/ecmascript' \
--header 'Authorization: Bearer 189|dMpXM17F1abw8T3p1hVj3gircpDTISiXbwRJSynZa4d7b343' \
--form 'product_title="Testing Product 3"' \
--form 'user_id="1"' \
--form 'category_id="2"' \
--form 'brand_id="1"' \
--form 'type_id="2"' \
--form 'material_id="2"' \
--form 'item_size_id="1"' \
--form 'quantity="5"' \
--form 'image_file=@"/C:/Users/Administrator/OneDrive/Pictures/a5.png"' \
--form 'description="dsffsffd fdsfsdfsd fdsfdsfdsfdsf"'



**Response:

{
    "message": "Product Successfully added",
    "data": {
        "product_title": "Testing Product 3",
        "user_id": "1",
        "category_id": "2",
        "brand_id": "1",
        "type_id": "2",
        "material_id": "2",
        "item_size_id": "1",
        "quantity": "5",

        "description": "dsffsffd fdsfsdfsd fdsfdsfdsfdsf",
        "image_file": "products/741756016024.png",
        "flush_type": null,
        "image_file": "products/321756015898.png",
        "status": 1,
        "created_at": "2025-08-24T06:13:44.000000Z",
        "pk_product_id": 7
    },
    "status": true
}


**7. add branch

curl --location 'https://app.aktisada.com/api/v1/add-brand' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2' \
--form 'brand_name="Brand-2"'

**Response:

{
    "message": "Detild Successfully listed",
    "data": {
        "brand_name": "brand-2",
        "updated_at": "2025-08-02T19:55:33.000000Z",
        "created_at": "2025-08-02T19:55:33.000000Z",
        "pk_brand_id": 6
    },
    "status": true
}


**8. products-list 

curl --location 'https://app.aktisada.com/api/v1/product-list' \
--header 'Accept: application/json' \
--header 'Authorization: ••••••' \
--form 'category_id="4"' \
--form 'brand_id=""' \
--form 'type_id=""' \
--form 'material_id=""' \
--form 'user_id=""' \
--form 'item_size=""' \
--form 'search=""'

**Response:


    "message": "products Successfully listed",
    "data": {
        "current_page": 1,
        "data": [
            {
                "pk_product_id": 11,
                "product_title": "test product 2",
                "category_id": 4,
                "user_id": 6,
                "brand_id": 8,
                "type_id": 4,
                "material_id": 2,
                "item_size_id": "1",
                "quantity": 20,
                "description": "this is a test product 2",
                "image_file": "products/951756063587.jpg",
                "status": 1,
                "created_at": "2025-08-24T19:26:27.000000Z",
                "pk_category_id": 4,
                "category": "Tiles",
                "pk_brand_id": 8,
                "brand_name": "test brand",
                "pk_type_id": 4,
                "type_name": "Soluble salt",
                "pk_material_id": 2,
                "material_name": "High glossy",
                "pk_size_id": 1,
                "item_size": "800x800",
                "image_path": "https://app.aktisada.com/uploads/products/951756063587.jpg",
                "user": {
                    "pk_user_id": 6,
                    "shop_name": "Haris",
                    "contact_person": "testing",
                    "country_code": 91,
                    "mobile": "9995051050",
                    "user_mobile": "919995051050",
                    "whatsapp_no": "91999501050",
                    "email": "harispendrive1@gmail.com",
                    "role_id": 2,
                    "address": null,
                    "location": "Manipuram",
                    "city": "koduvally",
                    "district": "calicut",
                    "state": "kerala",
                    "pincode": null,
                    "status": 1,
                    "created_by": null,
                    "created_at": "2025-08-16T09:46:06.000000Z",
                    "updated_at": "2025-08-17T09:52:21.000000Z"
                }
            },
            {
                "pk_product_id": 12,
                "product_title": "paper",
                "category_id": 4,
                "user_id": 6,
                "brand_id": 5,
                "type_id": 4,
                "material_id": 3,
                "item_size_id": "1",
                "quantity": 245,
                "description": "hshhe",
                "image_file": "products/831756095409.jpg",
                "status": 1,
                "created_at": "2025-08-25T04:16:49.000000Z",
                "pk_category_id": 4,
                "category": "Tiles",
                "pk_brand_id": 5,
                "brand_name": "Somany",
                "pk_type_id": 4,
                "type_name": "Soluble salt",
                "pk_material_id": 3,
                "material_name": "Glossy",
                "pk_size_id": 1,
                "item_size": "800x800",
                "image_path": "https://app.aktisada.com/uploads/products/831756095409.jpg",
                "user": {
                    "pk_user_id": 6,
                    "shop_name": "Haris",
                    "contact_person": "testing",
                    "country_code": 91,
                    "mobile": "9995051050",
                    "user_mobile": "919995051050",
                    "whatsapp_no": "91999501050",
                    "email": "harispendrive1@gmail.com",
                    "role_id": 2,
                    "address": null,
                    "location": "Manipuram",
                    "city": "koduvally",
                    "district": "calicut",
                    "state": "kerala",
                    "pincode": null,
                    "status": 1,
                    "created_by": null,
                    "created_at": "2025-08-16T09:46:06.000000Z",
                    "updated_at": "2025-08-17T09:52:21.000000Z"
                }
            },
            {
                "pk_product_id": 13,
                "product_title": "hff",
                "category_id": 4,
                "user_id": 6,
                "brand_id": 5,
                "type_id": 4,
                "material_id": 3,
                "item_size_id": "1",
                "quantity": 67,
                "description": "tsy",
                "image_file": "products/211756096203.jpg",
                "status": 1,
                "created_at": "2025-08-25T04:30:03.000000Z",
                "pk_category_id": 4,
                "category": "Tiles",
                "pk_brand_id": 5,
                "brand_name": "Somany",
                "pk_type_id": 4,
                "type_name": "Soluble salt",
                "pk_material_id": 3,
                "material_name": "Glossy",
                "pk_size_id": 1,
                "item_size": "800x800",
                "image_path": "https://app.aktisada.com/uploads/products/211756096203.jpg",
                "user": {
                    "pk_user_id": 6,
                    "shop_name": "Haris",
                    "contact_person": "testing",
                    "country_code": 91,
                    "mobile": "9995051050",
                    "user_mobile": "919995051050",
                    "whatsapp_no": "91999501050",
                    "email": "harispendrive1@gmail.com",
                    "role_id": 2,
                    "address": null,
                    "location": "Manipuram",
                    "city": "koduvally",
                    "district": "calicut",
                    "state": "kerala",
                    "pincode": null,
                    "status": 1,
                    "created_by": null,
                    "created_at": "2025-08-16T09:46:06.000000Z",
                    "updated_at": "2025-08-17T09:52:21.000000Z"
                }
            },
            {
                "pk_product_id": 14,
                "product_title": "teasing",
                "category_id": 4,
                "user_id": 6,
                "brand_id": 11,
                "type_id": 5,
                "material_id": 3,
                "item_size_id": "1",
                "quantity": 500,
                "description": "fiff",
                "image_file": "products/451756114513.jpg",
                "status": 1,
                "created_at": "2025-08-25T09:35:13.000000Z",
                "pk_category_id": 4,
                "category": "Tiles",
                "pk_brand_id": 11,
                "brand_name": "test brand 4",
                "pk_type_id": 5,
                "type_name": "Full body Vitrified",
                "pk_material_id": 3,
                "material_name": "Glossy",
                "pk_size_id": 1,
                "item_size": "800x800",
                "image_path": "https://app.aktisada.com/uploads/products/451756114513.jpg",
                "user": {
                    "pk_user_id": 6,
                    "shop_name": "Haris",
                    "contact_person": "testing",
                    "country_code": 91,
                    "mobile": "9995051050",
                    "user_mobile": "919995051050",
                    "whatsapp_no": "91999501050",
                    "email": "harispendrive1@gmail.com",
                    "role_id": 2,
                    "address": null,
                    "location": "Manipuram",
                    "city": "koduvally",
                    "district": "calicut",
                    "state": "kerala",
                    "pincode": null,
                    "status": 1,
                    "created_by": null,
                    "created_at": "2025-08-16T09:46:06.000000Z",
                    "updated_at": "2025-08-17T09:52:21.000000Z"
                }
            },
            {
                "pk_product_id": 15,
                "product_title": "gfbbj",
                "category_id": 4,
                "user_id": 7,
                "brand_id": 8,
                "type_id": 4,
                "material_id": 2,
                "item_size_id": "1",
                "quantity": 50,
                "description": "dhvh",
                "image_file": "products/741756115224.jpg",
                "status": 1,
                "created_at": "2025-08-25T09:47:04.000000Z",
                "pk_category_id": 4,
                "category": "Tiles",
                "pk_brand_id": 8,
                "brand_name": "test brand",
                "pk_type_id": 4,
                "type_name": "Soluble salt",
                "pk_material_id": 2,
                "material_name": "High glossy",
                "pk_size_id": 1,
                "item_size": "800x800",
                "image_path": "https://app.aktisada.com/uploads/products/741756115224.jpg",
                "user": {
                    "pk_user_id": 7,
                    "shop_name": "SF",
                    "contact_person": "testingRE",
                    "country_code": 91,
                    "mobile": "9995051051",
                    "user_mobile": "919995051051",
                    "whatsapp_no": "9995051051",
                    "email": "haris@getlead.co.uk",
                    "role_id": 2,
                    "address": null,
                    "location": "DHR",
                    "city": "D",
                    "district": "calicut",
                    "state": "kerala",
                    "pincode": null,
                    "status": 1,
                    "created_by": null,
                    "created_at": "2025-08-25T09:44:41.000000Z",
                    "updated_at": "2025-08-25T09:44:41.000000Z"
                }
            },
            {
                "pk_product_id": 17,
                "product_title": "ttttt",
                "category_id": 4,
                "user_id": 8,
                "brand_id": 20,
                "type_id": 6,
                "material_id": 3,
                "item_size_id": "2",
                "quantity": 250,
                "description": "fbvgjnas",
                "image_file": "products/631756302885.jpg",
                "status": 1,
                "created_at": "2025-08-27T13:54:45.000000Z",
                "pk_category_id": 4,
                "category": "Tiles",
                "pk_brand_id": 20,
                "brand_name": "At",
                "pk_type_id": 6,
                "type_name": "1200x1200",
                "pk_material_id": 3,
                "material_name": "Glossy",
                "pk_size_id": 2,
                "item_size": "600x600",
                "image_path": "https://app.aktisada.com/uploads/products/631756302885.jpg",
                "user": {
                    "pk_user_id": 8,
                    "shop_name": "jithin",
                    "contact_person": "core",
                    "country_code": 91,
                    "mobile": "9633578798",
                    "user_mobile": "919633578798",
                    "whatsapp_no": "9633578798",
                    "email": "koodathil.jithin@gmail.com",
                    "role_id": 2,
                    "address": null,
                    "location": "kakkodi",
                    "city": "calicut",
                    "district": "calicut",
                    "state": "kerala",
                    "pincode": null,
                    "status": 1,
                    "created_by": null,
                    "created_at": "2025-08-26T14:17:13.000000Z",
                    "updated_at": "2025-08-26T14:17:13.000000Z"
                }
            }
        ],
        "first_page_url": "https://app.aktisada.com/api/v1/product-list?page=1",
        "from": 1,
        "next_page_url": null,
        "path": "https://app.aktisada.com/api/v1/product-list",
        "per_page": 15,
        "prev_page_url": null,
        "to": 6
    },
    "status": true
}


**9. delete product

curl --location 'https://app.aktisada.com/api/v1/delete-product' \
--header 'Accept: application/json' \
--header 'Authorization: ••••••' \
--form 'product_id="1"'


**Response-1:

{
    "message": "Product successfully removed",
    "status": true
}

**Response-2:

{
    "message": "Product not found.!",
    "status": false
}



**10 edit-product

curl --location 'https://app.aktisada.com/api/v1/edit-product' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2' \
--form 'product_id="2"'

**Response:

{
    "message": "products Successfully listed",
    "data": [
        {
            "pk_product_id": 2,
            "product_title": "Testing Product 2",
            "category_id": 1,
            "user_id": 1,
            "brand_id": 2,
            "type_id": 1,
            "material_id": 1,
            "item_size": "10x15x5 inch",
            "quantity": 10,
            "description": null,
            "image_file": "products/121754161781.png",
            "status": null,
            "created_at": "2025-08-02T19:09:41.000000Z",
            "image_path": "https://app.aktisada.com/uploads/products/121754161781.png"
        }
    ],
    "status": true
}


**11 Update-product

curl --location 'https://app.aktisada.com/api/v1/update-product' \
--header 'Accept: application/ecmascript' \
--header 'Authorization: Bearer 189|dMpXM17F1abw8T3p1hVj3gircpDTISiXbwRJSynZa4d7b343' \
--form 'product_id="2"' \
--form 'product_title="This is testing product"' \
--form 'user_id="1"' \
--form 'category_id="2"' \
--form 'brand_id="1"' \
--form 'type_id="2"' \
--form 'material_id="2"' \
--form 'item_size_id="1"' \
--form 'quantity="5"' \
--form 'image_file=@"/C:/Users/Administrator/Pictures/a4.png"' \
--form 'image_file=@"/C:/Users/Administrator/OneDrive/Pictures/a5.png"' \
--form 'description="gdfdgdf gdfgdfgfd gdfgdfgdfg"'

** Response:

{
    "message": "Product Successfully updated",
    "data": {
        "pk_product_id": 2,
        "product_title": "This is testing product",
        "category_id": "2",
        "user_id": "1",
        "brand_id": "1",
        "type_id": "2",
        "material_id": "2",
        "item_size_id": "1",
        "quantity": "5",
        "description": "gdfdgdf gdfgdfgfd gdfgdfgdfg",
        "image_file": "products/591756015812.png",
        "status": null,
        "created_at": "2025-08-02T19:09:41.000000Z"
    },
    "status": true
}


**12 get product details


curl --location 'https://app.aktisada.com/api/v1/product-details' \
--header 'Accept: application/json' \
--header 'Authorization: ••••••' \
--form 'product_id="2"'

** Response:

{
    "message": "Product Successfully listed",
    "data": [
        {
            "pk_product_id": 2,
            "product_title": "This is testing product",
            "category_id": 2,
            "user_id": 1,
            "brand_id": 1,
            "type_id": 2,
            "material_id": 2,
            "item_size": "10x15x5 inch",
            "quantity": 5,
            "flush_type": null,
            "description": null,
            "image_file": "products/681754170863.png",
            "status": null,
            "created_at": "2025-08-02T19:09:41.000000Z",
            "image_path": "https://app.aktisada.com/uploads/products/681754170863.png",
            "user": {
                "pk_user_id": 1,
                "shop_name": "Shaji Enter prices",
                "contact_person": "shaji",
                "country_code": 91,
                "mobile": "1234567899",
                "user_mobile": "911234567899",
                "whatsapp_no": "1234567899",
                "email": "shaji@gmail.com",
                "role_id": 0,
                "address": "testing",
                "location": "karanthur",
                "city": "kunnamangalam",
                "district": "kozhikode",
                "state": "kerala",
                "pincode": null,
                "status": 1,
                "created_by": 0,
                "created_at": "2025-08-02T09:23:59.000000Z",
                "updated_at": "2025-08-02T09:23:59.000000Z"
            }
        }
    ],
    "status": true
}

** get-my-products
curl --location 'https://app.aktisada.com/api/v1/get-my-products' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 183|sRPxCtKEbL643U9XiUorxQkOMqeVr2sbpHJRpdB1292867df' \
--form 'category_id=""' \
--form 'brand_id=""' \
--form 'type_id=""' \
--form 'material_id=""' \
--form 'user_id=""' \
--form 'item_size=""' \
--form 'search=""' \
--form 'user_id="1"'

**Response


{
    "message": "products Successfully listed",
    "data": {
        "current_page": 1,
        "data": [
            {
                "pk_product_id": 2,
                "product_title": "This is testing product",
                "category_id": 1,
                "user_id": 1,
                "brand_id": 1,
                "type_id": 2,
                "material_id": 2,
                "item_size_id": "10x15x5 inch",
                "quantity": 5,
                "flush_type": null,
                "description": null,
                "image_file": "products/681754170863.png",
                "status": null,
                "created_at": "2025-08-02T19:09:41.000000Z",
                "pk_category_id": null,
                "category": null,
                "pk_brand_id": 1,
                "brand_name": "bbbbbbbbbb",
                "pk_type_id": 2,
                "type_name": "kkkkkkkkkkkk",
                "pk_material_id": null,
                "material_name": null,
                "pk_size_id": null,
                "item_size": null,
                "pk_user_id": 1,
                "shop_name": "Shaji Enter prices",
                "image_path": "https://app.aktisada.com/uploads/products/681754170863.png"
            }
        ],
        "first_page_url": "https://app.aktisada.com/api/v1/get-my-products?page=1",
        "from": 1,
        "next_page_url": "https://app.aktisada.com/api/v1/get-my-products?page=2",
        "path": "https://app.aktisada.com/api/v1/get-my-products",
        "per_page": 1,
        "prev_page_url": null,
        "to": 1
    },
    "status": true
}


** check-user-exist
** to check the user is exist or not ( some times change password, mobile)

curl --location 'https://app.aktisada.com/api/v1/check-user-exist' \
--header 'Accept: application/json' \
--form 'mobile="1234567899"' \
--form 'password="123456"'

**Response

{
    "message": "User Found!",
    "data": {
        "user": {
            "pk_user_id": 1,
            "shop_name": "Shaji Enter prices",
            "contact_person": "shaji",
            "country_code": 91,
            "mobile": "1234567899",
            "user_mobile": "911234567899",
            "whatsapp_no": "1234567899",
            "email": "shaji@gmail.com",
            "role_id": 0,
            "address": "testing",
            "location": "karanthur",
            "city": "kunnamangalam",
            "district": "kozhikode",
            "state": "kerala",
            "pincode": null,
            "status": 1,
            "created_by": 0,
            "created_at": "2025-08-02T09:23:59.000000Z",
            "updated_at": "2025-08-04T16:29:53.000000Z"
        }
    },
    "status": true
}

** check-app-version
** to check app-version ( if invalid version to forcefully update app from playstore)

curl --location 'https://app.aktisada.com/api/v1/check-app-version' \
--form 'app_version="1.0.1"'

**Response
{
    "message": "Success!",
    "version": "1.0.1",
    "status": true
}






