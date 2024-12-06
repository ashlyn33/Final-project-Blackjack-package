#' Function handling the dealer's turn during game play
#'
#' Automated game play functionality for the dealer based on standard dealer rules in blackjack.
#'
#' @details
#' The dealer will always follow the same rules when deciding whether to "hit" or "stay" on their hand. If the dealer's hand total is greater than or
#' equal to 17, given by `sum.hand()`, the dealer will "stay" and will not draw another card. If the dealer's hand total is less than 17, the dealer will "hit" and draw another card.
#' This process is repeated until the dealer's hand is a "bust" or the dealer must "stay". This function is called within the user game play function `blackjack()`.
#'
#' @param d.hand this parameter calls the dealer's initial hand of two cards
#' @return returns a result at the end of the dealer's turn, either "bust" or "stay"
#'
#'dealers.turn()
dealers.turn <- function(d.hand) {
  repeat {
    dealer.sum <- sum.hand(d.hand)

    if (dealer.sum >= 17) {
      cat("Dealer stays on >= 17.", "\n\n", "Dealer's hand:", "\n", paste(d.hand$card.id, collapse = ", "))
      return(list(d.hand = d.hand, result = ifelse(dealer.sum > 21, "Bust", "Stay")))
    }

    cat("The dealer hits on < 17.\n\n")
    d.hand <- rbind(d.hand, deal.cards(shoe, 1))
  }
}
