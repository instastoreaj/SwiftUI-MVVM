//
//  HttpClientTests.swift
//  MoviesAppUnitTests
//
//  Created by Lucas Ferreira Machado on 02/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import XCTest

class HttpClientTests: XCTestCase {
    
    let httpClient: HttpClient = HttpClient()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetMoviesWithSuccess() throws {
        self.measure {
            httpClient.getMoviesBySearch(search: "batman") { result in
                switch result {
                case .success(let movies):
                    assert(movies != nil, "movies is nil")
                case .failure(let networkError):
                    switch networkError {
                    case .noData(let error):
                        assertionFailure("\(networkError) : \(String(describing: error?.localizedDescription))")
                    default:
                        assertionFailure("\(networkError)")
                    }
                }
            }
        }
    }
    
    func testGetMoviesWithAPIError() throws { //"#$%ˆ&*"
            httpClient.getMoviesBySearch(search: "The") { result in
                switch result {
                case .success(let movies):
                    assert(movies != nil, "movies is not nil")
                    
                case .failure(let networkError):
                    switch networkError {
                    case .noData(let error):
                        assertionFailure("Invalid error for api: \(networkError) : \(String(describing: error?.localizedDescription))")
                    case .responseError(let errorResponse):
                        print(errorResponse)
                    default:
                        assertionFailure("Invalid error for error: \(networkError)")
                    }
                } 
        }
    }
    
    func testGetMovieDetailsByImdbWithSuccess() throws {
        self.measure {
            httpClient.getMovieDetailsByImdbId(imdbId: "tt3896198") { result in
                switch result {
                case .success(let movieDetails):
                    assert(movieDetails != nil, "movieDetails is nil")
                    assert(movieDetails?.title == "Guardians of the Galaxy Vol. 2", "Incorrect movieDetails title")
                case .failure(let networkError):
                    switch networkError {
                    case .noData(let error):
                        assertionFailure("\(networkError) : \(String(describing: error?.localizedDescription))")
                    default:
                        assertionFailure("\(networkError)")
                    }
                }
            }
        }
    }
    
    func testGetMovieDetailsByImdbWithAPIError() throws {
        httpClient.getMovieDetailsByImdbId(imdbId:"12345") { result in
                switch result {
                case .success(let movieDetails):
                    assert(movieDetails != nil, "invalid result")
                    
                case .failure(let networkError):
                    switch networkError {
                    case .noData(let error):
                        assertionFailure("Invalid error for api: \(networkError) : \(String(describing: error?.localizedDescription))")
                    case .responseError(let errorResponse):
                        print(errorResponse)
                        assert(errorResponse.error == "Incorrect IMDb ID.", "invalid result")
                    default:
                        assertionFailure("Invalid error for error: \(networkError)")
                    }
                }
        }
    }
}
