//
//  HomeService.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import Foundation

protocol HomeServicing {
    func fetchHome() async throws -> homeResponse
}
final class HomeService: HomeServicing {
    func fetchHome() async throws -> homeResponse {
        let data = Data(mockHomeJSON.utf8)
        return try JSONDecoder().decode(homeResponse.self, from: data)
    }
}

let mockHomeJSON = """
{
  "sections": [
    {
      "id": "0",
      "componentType": "video",
      "title": "blackFriday",
      "items": [
        { "image": "blackFriday" }
      ]
    },
    {
      "id": "1",
      "componentType": "banner",
      "title": "Ofertas del día",
      "items": [
        { "image": "https://api.dynapictures.com/links/b17daaf1b3.webp" }
      ]
    },
    {
      "id": "2",
      "componentType": "carousel",
      "title": "Recomendados",
      "items": [
        { "id": "p1", "name": "Producto 1", "price": 199,"image":"https://media.istockphoto.com/id/1436061606/photo/flying-colorful-womens-sneaker-isolated-on-white-background-fashionable-stylish-sports-shoe.jpg?s=1024x1024&w=is&k=20&c=anQJwG2c4-ZEqf9BgeIm3ph76JZWSU2-GbOE7b_OzcA=" },
        { "id": "p2", "name": "Producto 2", "price": 299,"image":"https://media.istockphoto.com/id/1391792108/photo/sport-shoes-isolated-on-white-background.jpg?s=1024x1024&w=is&k=20&c=vC9QQRVkRbheILAZsc03Ij13aFUvoa89eIrwzgkaC78="  },
        { "id": "p3", "name": "Producto 3", "price": 199,"image":"https://media.istockphoto.com/id/1132357232/photo/pink-sport-shoes-on-white-background.jpg?s=1024x1024&w=is&k=20&c=AwRyYpr6gn-e8zaM2fJnGE_CjtFCVpGDHdepEiB-69s="  },
        { "id": "p4", "name": "Producto 4", "price": 99,"image":"https://media.istockphoto.com/id/1633138291/photo/sneakers-fashion-sports-shoes.jpg?s=1024x1024&w=is&k=20&c=sWGoFv7-yFC4beevLXCq2roHFwfDCTt43Opb-xIEXuI="  },
        { "id": "p5", "name": "Producto 5", "price": 199,"image":"https://media.istockphoto.com/id/1129868661/photo/lime-or-green-sneakers.jpg?s=1024x1024&w=is&k=20&c=tIy8z_wwLYai3CGOURvOehG36ZCtc4cA4WuiKr0uR8Q="  }
      ]
    },
    {
      "id": "3",
      "componentType": "static",
      "title": "Categorías",
      "items": [
        { "id": "p1","name": "Clothes", "image":"https://media.istockphoto.com/id/1170635789/photo/close-up-of-colorful-t-shirts-on-hangers-apparel-background.jpg?s=1024x1024&w=is&k=20&c=Wd7_N9M3ENl5NZve3Y3PvaUGMKHQxVcDCZkuPc3o49o=" },
        { "id": "p2","name": "Tech", "image":"https://media.istockphoto.com/id/983392432/photo/tablet-computer-smartphone-keyboard-smart-watches-computer-mouse-on-the-wooden-table.jpg?s=1024x1024&w=is&k=20&c=YeSa78iYdY0g0rz7s3qI7gW5RQY4t_Ob0qIcx6Z11C4=" },
        { "id": "p3","name": "Home", "image":"https://media.istockphoto.com/id/522778853/photo/household-appliances.jpg?s=1024x1024&w=is&k=20&c=FelI2HhCGVGJL3mquRBetR55Jxzlacers3ZifAuHl9w=" },
        { "id": "p4","name": "Gaming", "image":"https://media.istockphoto.com/id/1287173856/photo/new-playstation-5.jpg?s=1024x1024&w=is&k=20&c=9VsU4w5NBKEYxIWP-qN0VFKfGsGVByI4oh76LryRLIw=" },
        { "id": "p5","name": "Groceries", "image":"https://media.istockphoto.com/id/1449032425/photo/shopping-bag-full-of-healthy-food-on-blue.jpg?s=1024x1024&w=is&k=20&c=1O0frg75q_i-00X30b4hr_G_JSwfWEXG40I9RZLyhoY=" },
        { "id": "p6","name": "Automotive", "image":"https://media.istockphoto.com/id/2181056850/photo/car-rushes-along-the-highway-at-sunset-low-angle-side-view.jpg?s=1024x1024&w=is&k=20&c=ZOjANH2SYY2oWdQeVpNdaLGZAB-9avGcLkysED74BxU=" },
        { "id": "p7","name": "Toys", "image":"https://media.istockphoto.com/id/1017309510/photo/box-of-toys-on-the-floor-teddy-bear-in-box-vintage-tone-charitable-contribution-donation.jpg?s=1024x1024&w=is&k=20&c=epmZljnO5xqTuDdkHn8MO8_XZPh-mILJjz4opaLg2LQ=" },
        { "id": "p8","name": "Garden", "image":"https://media.istockphoto.com/id/1134719594/photo/gardening-tools-and-flowers-on-soil.jpg?s=1024x1024&w=is&k=20&c=dMsyw1Fh7c889ar7jXjPslHad3McMOvnPMXE349evWg=" }
      ]
    }
  ]
}

"""

