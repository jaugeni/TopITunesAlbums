//
//  TopListViewModelTests.swift
//  TopITunesAlbumsTests
//
//  Created by YAUHENI IVANIUK on 3/4/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import XCTest
@testable import TopITunesAlbums

class TopListViewModelTests: XCTestCase {
    
    let topListViewModel = TopListViewModel()

    override func setUp() {
        
        if let url = Bundle.main.url(forResource: "TopListMock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let feed = try decoder.decode(FeedModel.self, from: data)
                let albumsModel = feed.feed.results
                topListViewModel.albumsModel = albumsModel
            } catch {
                
            }
        }
    }
        

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlbumList() {
        XCTAssertEqual(topListViewModel.albumsCount, 10)
    }
    
    func testReturnAlbumData() {
        let artistName = "Justin Bieber"
        let releaseDate = "2020-02-14"
        let name = "Changes"
        let copyright = "℗ 2020 Def Jam Recordings, a division of UMG Recordings, Inc."
        let artworkUrl100 = "https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/49/c1/04/49c10497-421b-5480-0e88-2b1b9c7b038c/20UMGIM03126.rgb.jpg/200x200bb.png"
        let genre = "Pop"
        let url = "https://music.apple.com/us/album/changes/1496639180?app=music"
    
        let album = topListViewModel.album(for: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(album.artistName, artistName)
        XCTAssertEqual(album.releaseDate, releaseDate)
        XCTAssertEqual(album.name, name)
        XCTAssertEqual(album.copyright, copyright)
        XCTAssertEqual(album.artworkUrl100, artworkUrl100)
        XCTAssertEqual(album.genre, genre)
        XCTAssertEqual(album.url, url)
    }

}
