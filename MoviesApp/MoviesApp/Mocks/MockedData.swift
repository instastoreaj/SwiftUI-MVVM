//
//  MockedMovie.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 06/06/21.
//  Copyright © 2021 Lucas Ferreira Machado. All rights reserved.
//

import Foundation

let movieJson = """
{
"Title":"Batman Begins", 
"Year":"2005", 
"imdbID":"tt0372784", 
"Type":"movie", 
"Poster":"https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
}
"""

let MockedMovie = movieJson.tryDecode(Movie.self)!

let MockedMovies = [MockedMovie]

let MockedMovieViewModel = MovieViewModel(movie: MockedMovie)

let MockedMovieListViewModel = [MockedMovieViewModel, MockedMovieViewModel, MockedMovieViewModel, MockedMovieViewModel]


let movieDetailJson = """
    {
    "Title":"Guardians of the Galaxy Vol. 2", 
    "Year":"2017", 
    "Rated":"PG-13", 
    "Released":"05 May 2017"'Runtime":"136 min", Genre":"Action, Adventure, Comedy", 
    "Director":"James Gunn", 
    "Writer":"James Gunn, Dan Abnett, Andy Lanning", 
    "Actors":"Chris Pratt, Zoe Saldana, Dave Bautista", 
    "Plot":"The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.", 
    "Language":"English", 
    "Country":"United States", 
    "Awards":"Nominated for 1 Oscar. 15 wins & 58 nominations total", 
    "Poster":"https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg", 
    "Ratings":[{"Source":"Internet Movie Database", 
    "Value":"7.6/10"}, {"Source":"Rotten Tomatoes", 
    "Value":"85%"}, {"Source":"Metacritic", 
    "Value":"67/100"}], 
    "Metascore":"67", 
    "imdbRating":"7.6", 
    "imdbVotes":"589, 440", 
    "imdbID":"tt3896198", 
    "Type":"movie", 
    "DVD":"10 Jul 2017", 
    "BoxOffice":"$389, 813, 101", 
    "Production":"Walt Disney Pictures, Marvel Studios", 
    "Website":"N/A", 
    "Response":"True"
    }
    """

