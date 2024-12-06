#' Deal cards during game play
#'
#' A function that is called in several other functions when dealing one or more cards is required during game play.
#'
#' @details
#' This function is able to deal a card whenever required for either the player or dealer's game play. This function handles the card IDs and card values for cards dealt into play, and additionally keeps track of
#' of which cards are remaining in the shoe. This function ensures that when cards are dealt from the shoe, they are not returned to the shoe until the user calls the `new_card_shoe()` function to reset the shoe.
#' This function is integrated into the functions `dealers.turn()` and `players.turn()`, in addition to the user called game play function `blackjack()`.
#'
#' @param shoe the shoe parameter is built into and made available through the user function `new_card_shoe()`
#' @param n the number of cards to be dealt
#' @return the function returns a subset data frame of the dealt cards, and the shoe is updated to remove the dealt cards
#'
#'deal.cards()
deal.cards <- function(shoe, n = 1) {
  if (n > nrow(shoe)) {
    stop("Shoe empty. Restart the game for newly shuffled shoe.")
  }

  cards.dealt <- shoe[1:n, ]
  shoe <<- shoe[-(1:n), ]

  return(cards.dealt)
}
