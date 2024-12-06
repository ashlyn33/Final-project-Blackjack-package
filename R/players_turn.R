#' Function handling the player's turn during game play
#'
#' This function handles the user/player's turn during game play, allowing the user the option to "hit" or "stay".
#'
#' @details
#' When it is the user's turn, the user is presented with their two initially dealt cards and given the option to "hit" for another card to be dealt, or "stay" to move forward with their current
#' cards and await the dealer's turn. If the user decides to "hit", the process is repeated until the user "bust" or the user decides to "stay". The user must input either "h" to hit or "s" to stay.
#' This function is called within the user game play function `blackjack()`.
#'
#' @param p.hand this parameter calls the user's initial hand of two cards
#' @return returns a result at the end of the dealer's turn, either "bust" or "stay"
#'
#'players.turn()
players.turn <- function(p.hand) {
  repeat {
    cat("Your hand:", paste(p.hand$card.id, collapse = ", "), "\n")
    player.sum <- sum.hand(p.hand)

    if (player.sum > 21) {
      cat("Bust!\n")
      return(list(p.hand = p.hand, result = "Bust"))
    }

    play <- readline("Hit or stay? (Enter 'h' or 's' to continue): ")
    if (play == "s") {
      return(list(p.hand = p.hand, result = "Stay"))
    }

    p.hand <- rbind(p.hand, deal.cards(shoe, 1))
  }
}
