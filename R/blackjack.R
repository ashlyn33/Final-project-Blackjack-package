#' Main game play function for Blackjack game
#'
#' The central function called by the user to play the game of blackjack.
#'
#' @details
#' This is the main user called function that allows for game play. After the user call the `new_card_shoe()` function, the game is ready to start using this function, `blackjack()`. Each time `blackjack()`
#' is run, it initializes a round of blackjack by dealing a hand to the user/player and a hand to dealer. The user can see their two-card hand, along with the dealer's "up" card. The integrated `players.turn()` and `dealers.turn()` functions
#' facilitate game play until the round is finished. The result can be dealer wins, player wins, or a push (tie). The function returns prompts, card IDs, hand totals, and results throughout the round until
#' the round is completed. To play another round using the updated shoe (starting shoe minus the cards dealt in the subsequent round), the user calls the same `blackjack()` function.
#'
#' @export
blackjack <- function() {
  deal_dealer <- deal.cards(shoe, 2)
  deal_player <- deal.cards(shoe, 2)
  up_card_dealer <- deal_dealer[1, ]

  cat("Cards have been dealt. It is your turn...\n\n")
  cat("Your hand:\n", paste(deal_player$card.id, collapse = ", "), "\n\n")
  cat("Dealer's up card:\n", paste(up_card_dealer$card.id), "\n\n")

  result_p <- players.turn(deal_player)
  hand_p <- result_p$p.hand
  current_p <- result_p$result

  if (current_p == "Bust") {
    cat("Dealer wins on player bust. Try again!\n")
    cat("Your card total:", "\n")
    return(print(sum.hand(hand_p)))
  }

  cat("You stay on", sum.hand(hand_p), "\n\n")
  cat("It is the dealer's turn...\n\n")
  cat("Dealer's hand:", paste(deal_dealer$card.id, collapse = ", "), "\n")

  result_d <- dealers.turn(deal_dealer)
  hand_d <- result_d$d.hand
  current_d <- result_d$result

  cat("\n\n")
  cat("Dealer's card total:", paste((sum.hand(hand_d))), "\n")
  cat("Your card total:", paste((sum.hand(hand_p))), "\n\n")

  total_dealer <- sum.hand(hand_d)
  total_player <- sum.hand(hand_p)


  if (current_p == "Bust") {
    cat("Dealer wins on player bust. Try again!\n")
  } else if (current_d == "Bust") {
    cat("Congrats, you won!", "\n", "Dealer busted!")
  } else if (total_dealer > total_player) {
    cat("Bummer, you lost this one!", "\n", "Dealer's total wins!")
  } else if (total_player > total_dealer) {
    cat("Congrats, you won!", "\n", "Player's total wins!")
  } else {
    cat("Push!", "\n", "You tied the dealer!", "\n\n")
  }

}
