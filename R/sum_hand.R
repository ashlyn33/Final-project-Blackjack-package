#' Calculate the total value of a hand in Blackjack
#'
#' Following the rules of blackjack, this function calculates the total value of a given hand at various times during the game for either the dealer or user.
#'
#' @details
#' In blackjack, cards ranked 2 through 10 have a value matching their rank. The ranks Jack, Queen, and King have a value of 10. The rank of Ace can either have a value of 1 or 11. This function calculates the
#' total value of the hand, taking into account if the hand should count an Ace as either value 1 or value 11 based on the total value of the other cards in the hand. The function is called within `dealers.turn()` and `players.turn()`, in addition to the user called game play function `blackjack()`.
#'
#' @param hand the hand parameter defines the hand for which the total value is being calculated
#' @return the function returns the total value of the hand
#'
#'sum.hand()
sum.hand <- function(hand) {
  sum.in.hand <- sum(hand$value)
  while (sum.in.hand > 21 && any(hand$Rank == "Ace" & hand$value == 11)) {
    aces <- which(hand$Rank == "Ace" & hand$value == 11)[1]
    hand$value[aces] <- 1
    sum.in.hand <- sum(hand$value)
  }
  return(sum.in.hand)
}
