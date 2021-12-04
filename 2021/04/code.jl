# read the input
# first sequence of numbers, the the boards each separated by a blank line

lines = readlines("input.txt")
sequence = parse.(Int, split(lines[1], ","))

# read one board; lines 3-7, 9-13, 15-19, etc
# 3:6:length(lines)

function readBoard(ss)
  entries = split.(ss, " ", keepempty=false)
  board = zeros(Int, 5,5)
  for i in 1:5
   board[i, :] = parse.(Int, entries[i])
  end
  board
end

boards = []
for i in 3:6:length(lines)
  append!(boards, [readBoard(lines[i:(i+4)])])
end

# called = zeros(Int, 5, 5, length(boards));

# boards is a list of 100 bingo boards, each laid out as a 5x5 matrix
# called is a matrix of 0s indicating when numbers called

function markBoards!(b, called, call)
  for i in 1:length(b)
    for j in 1:5
      for k in 1:5
        if call == b[i][j,k]
          called[j,k,i] = 1
        end
      end
    end
  end 
end

function checkBoards(called)
  "find the indexes of any board with 5 rows or columns checked"
  won = zeros(Int, 0)
  for i in 1:(size(called)[3])
     if sum( 5 .== sum(called[:,:,i], dims=1)) + sum( 5 .== sum(called[:,:,i], dims=2)) > 0
       append!(won, i)
     end
  end 
  won
end

winner = zeros(Int, 0)
called = zeros(Int, 5, 5, length(boards));

for calling in sequence
  markBoards!(boards, called, calling)
  winner = checkBoards(called)
  if length(winner)>0
    print(calling)  # ugly
    break
  end
end

# winner found
# get numbers not called

boards[winner][1]
called[:,:,winner]

boards[winner][1] .* ( 1 .- called[:,:,winner])

54 * sum(boards[winner][1] .* ( 1 .- called[:,:,winner]))

# part 2, find the board that wins last

called = zeros(Int, 5, 5, length(boards));

for calling in sequence
  markBoards!(boards, called, calling)
  winner = checkBoards(called)
  if length(winner) == (length(boards)-1)
    print(setdiff(1:length(boards), winner))
  elseif length(winner) == length(boards)
    print(calling)  # ugly
    break
  end
end

loser = 59
boards[loser]
called[:,:,loser]

boards[loser] .* ( 1 .- called[:,:,loser])

42 * sum(boards[loser] .* ( 1 .- called[:,:,loser]))

