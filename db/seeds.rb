# frozen_string_literal: true

clients = Client.create([{ name: 'Google' }, { name: 'Facebook' }, { name: 'Space X' }, { name: 'Tesla' }])

coupon = Coupon.create([{ discount: 25.0 }, { discount: 50.0 }, { discount: 75.0 }, { discount: 100.0 }])

products = Product.create([{ name: 'Content Disclosure', price: 25.0 },
                           { name: 'Maximize Disclosure', price: 50.0 },
                           { name: 'Share', price: 75.0 },
                           { name: 'Likes', price: 100.0 }])

Invoice.create([{ client: clients.first, product: products.first, discount: coupon.first.discount },
                { client: clients.second, product: products.second, discount: coupon.second.discount },
                { client: clients.third, product: products.third, discount: coupon.third.discount },
                { client: clients.last, product: products.last, discount: coupon.last.discount }])

roles = Role.create([{ name: 'Admin' }, { name: 'Manager' }, { name: 'Seller' }, { name: 'Client' }])

RolePermission.create([{ role: roles.first, permission: 'all.client.all' },
                       { role: roles.first, permission: 'all.coupon.all.read' },
                       { role: roles.first, permission: 'all.user' }])

User.create([{ email: 'admin@rdstation.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.first] },
             { email: 'manager@rdstation.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.second] },
             { email: 'seller@rdstation.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.third] },
             { email: 'client@rdstation.com', password: 'teste123', password_confirmation: 'teste123', roles: [roles.last] }])

