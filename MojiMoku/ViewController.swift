import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let charID = 666
        let url = "https://www.animecharactersdatabase.com/api_series_characters.php?character_id" + String(charID)
        getData(from: url)
    }

    private func getData(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            guard let data = data, error == nil else {
                print("Something Went Wrong")
                return
            }
            var result: Response?
            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print("failed to convert (error.localizedDescription)")
            }

            guard let json = result else{
                return
            }
            print(json.status, json.results.name)
        })
        task.resume()
    }
}


struct Response: Codable {
    let results: MyResult
    let status: String
}

struct MyResult: Codable {
    let id: Int
    let anime_id: Int
    let anime_image: String
    let anime_character: String
    let origin: String
    let gender: String
    let name: String
    let desc: String
}

/*
 {
"id": 666,
"anime_id": 90,
"anime_image": "https://ami.animecharactersdatabase.com/productimages/90.jpg",
"character_image": "https://ami.animecharactersdatabase.com/./images/maihime/Reito_thumb.jpg",
"origin": "Mai-HiME - The Genealogical Tree of Fate",
"gender": "Male",
"name": "Reito Kanzaki",
"desc": "Reito Kanzaki is a character from the visual novel Mai-HiME - The Genealogical Tree of Fate."
}
 */
