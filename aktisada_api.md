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
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2'



**Response:

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
        ]
    },
    "status": true
}






**5. add-product

curl --location 'https://app.aktisada.com/api/v1/add-product' \
--header 'Accept: application/ecmascript' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2' \
--form 'product_title="Testing Product 3"' \
--form 'user_id="1"' \
--form 'category_id="2"' \
--form 'brand_id="1"' \
--form 'type_id="2"' \
--form 'material_id="2"' \
--form 'item_size="10x15x5 inch"' \
--form 'quantity="5"' \
--form 'image_file=@"/C:/Users/Administrator/Pictures/a2.png"' \
--form 'flush_type=""'



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
        "item_size": "10x15x5 inch",
        "quantity": "5",
        "image_file": "products/551754161845.png",
        "flush_type": null,
        "status": 1,
        "created_at": "2025-08-02T19:10:45.000000Z",
        "pk_product_id": 3
    },
    "status": true
}



**6. add branch

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


**7. products-list 

curl --location 'https://app.aktisada.com/api/v1/product-list' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2' \
--form 'category_id="1"' \
--form 'brand_id="2"' \
--form 'type_id=""' \
--form 'material_id=""' \
--form 'user_id="1"' \
--form 'item_size="10x15x5 inch"'

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
            "flush_type": null,
            "description": null,
            "image_file": "products/121754161781.png",
            "status": null,
            "created_at": "2025-08-02T19:09:41.000000Z",
            "pk_category_id": 1,
            "category": "bbbbbbbbbbbbbb",
            "pk_brand_id": 2,
            "brand_name": "yyyyyyyyyyyy",
            "pk_type_id": 1,
            "type_name": "mmmmmmmmmm",
            "pk_material_id": 1,
            "material_name": "mmmmmmmmmmmm",
            "pk_user_id": 1,
            "shop_name": "Shaji Enter prices"
        }
    ],
    "status": true
}


**8. delete product

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



**9 edit-product

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
            "flush_type": null,
            "description": null,
            "image_file": "products/121754161781.png",
            "status": null,
            "created_at": "2025-08-02T19:09:41.000000Z",
            "image_path": "https://app.aktisada.com/uploads/products/121754161781.png"
        }
    ],
    "status": true
}


**10 Update-product

curl --location 'https://app.aktisada.com/api/v1/update-product' \
--header 'Accept: application/ecmascript' \
--header 'Authorization: Bearer 178|YXddbfAqpWc5uXCGre1fPTAUv9EibA6UTiYK7nh533463fe2' \
--form 'product_id="2"' \
--form 'product_title="This is testing product"' \
--form 'user_id="1"' \
--form 'category_id="2"' \
--form 'brand_id="1"' \
--form 'type_id="2"' \
--form 'material_id="2"' \
--form 'item_size="10x15x5 inch"' \
--form 'quantity="5"' \
--form 'image_file=@"/C:/Users/Administrator/Pictures/a4.png"' \
--form 'flush_type=""'

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
        "item_size": "10x15x5 inch",
        "quantity": "5",
        "flush_type": null,
        "description": null,
        "image_file": "products/681754170863.png",
        "status": null,
        "created_at": "2025-08-02T19:09:41.000000Z"
    },
    "status": true
}


**11 get product details


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


