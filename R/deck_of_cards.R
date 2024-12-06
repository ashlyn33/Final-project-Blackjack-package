#' A function that creates a standard deck of 52 cards
#'
#' A standard deck contains 52 cards. There are 4 suits and 13 ranks.
#'
#' This function creates a data frame with all 52 cards in a standard deck.
#' This function is critical for the creation of a shoe with for card decks downstream.
#'
#' @return a standard 52-card deck as a data frame
#'
#'card.deck()
card.deck <- function() {
  rank <- c("2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace")
  suit <- c("Spades", "Diamonds", "Hearts", "Clubs")
  card.values <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11)
  full.deck <- expand.grid(Suit = suit, Rank = rank)
  full.deck$value <- rep(card.values, each = 4)
  full.deck$card.id <- paste(full.deck$Rank, "of", full.deck$Suit)

  return(full.deck)
}
