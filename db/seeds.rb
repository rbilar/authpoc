# frozen_string_literal: true

# Roles
roles = Role.create([{ name: 'Admin' }, { name: 'Manager' }, { name: 'Seller' }, { name: 'Client' }])

# Permissions
RolePermission.create([{ role: roles.first, permission: 'all' }])

RolePermission.create([{ role: roles.second, permission: 'all.client.all' },
                       { role: roles.second, permission: 'all.coupon.all' },
                       { role: roles.second, permission: 'all.invoice.all' },
                       { role: roles.second, permission: 'all.product.all' }])

RolePermission.create([{ role: roles.third, permission: 'all.client.all' },
                       { role: roles.third, permission: 'all.coupon.read' },
                       { role: roles.third, permission: 'all.invoice.all' }])

RolePermission.create([{ role: roles.fourth, permission: 'all.invoice.owner.create' },
                       { role: roles.fourth, permission: 'all.invoice.owner.read' },
                       { role: roles.fourth, permission: 'all.user.owner' }])

# Users
User.create([{ email: 'admin@bilar.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.first] },
             { email: 'manager@bilar.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.second] },
             { email: 'seller@bilar.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.third] }])

google_user   = User.create({ email: 'google@bilar.com'  , password: 'teste123', password_confirmation: 'teste123', roles: [roles.fourth] })

facebook_user = User.create({ email: 'facebook@bilar.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.fourth] })

musk_user     = User.create({ email: 'musk@bilar.com'    , password: 'teste123', password_confirmation: 'teste123', roles: [roles.fourth] })

# Clients
clients = Client.create([{ name: 'Google'  , user: google_user },
                         { name: 'Facebook', user: facebook_user },
                         { name: 'Space X' , user: musk_user },
                         { name: 'Tesla'   , user: musk_user }])

# Coupons
coupon = Coupon.create([{ discount: 25.0 }, { discount: 50.0 }, { discount: 75.0 }, { discount: 100.0 }])

# Products
products = Product.create([{ name: 'Content Disclosure', price: 25.0 },
                           { name: 'Maximize Disclosure', price: 50.0 },
                           { name: 'Share', price: 75.0 },
                           { name: 'Likes', price: 100.0 }])

# Invoices
Invoice.create([{ client: clients.first, product: products.first, discount: coupon.first.discount },
                { client: clients.second, product: products.second, discount: coupon.second.discount },
                { client: clients.third, product: products.third, discount: coupon.third.discount },
                { client: clients.fourth, product: products.fourth, discount: coupon.fourth.discount }])
