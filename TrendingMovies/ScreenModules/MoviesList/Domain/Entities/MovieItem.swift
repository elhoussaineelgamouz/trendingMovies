//
//  MovieItem.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

struct MovieItem: Codable {

    var id: Int?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case id, overview, release_date, title, poster_path
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let id = try? container.decode(Int.self, forKey: .id) {
            self.id = id
        }

        if let overview = try? container.decode(String.self, forKey: .overview) {
            self.overview = overview
        }

        if let release_date = try? container.decode(String.self, forKey: .release_date) {
            self.release_date = release_date
        }

        if let title = try? container.decode(String.self, forKey: .title) {
            self.title = title
        }

        if let poster_path = try? container.decode(String.self, forKey: .poster_path) {
            self.poster_path = poster_path
        }
    }
}
