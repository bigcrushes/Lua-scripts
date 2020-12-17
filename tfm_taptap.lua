last_note = os.time()
random_num = {100,300,500,700}
highest_score = 0
last_played = {}
scores = {}

function eventNewPlayer(name)
last_played[name] = -1
scores[name] = 0
tfm.exec.setPlayerScore(name, 0, false)
end

for name,player in pairs(tfm.get.room.playerList) do
-- Listen for UP
tfm.exec.bindKeyboard(name, 1, true, true) 
-- Listen for RIGHT
tfm.exec.bindKeyboard(name, 2, true, true) 
-- Listen for DUCK
tfm.exec.bindKeyboard(name, 3, true, true) 
-- Listen for LEFT 
tfm.exec.bindKeyboard(name, 0, true, true) 
end

function eventLoop(currentTime, timeRemaining)
if timeRemaining > 5000 then
if last_note < os.time() - 1500 then
note = random_num[math.random(4)]
last_note = os.time()
note_id = tfm.exec.addShamanObject(1, note, 0, 0, 0, 2, True)
end
local to_remove = {}
for id, object in pairs(tfm.get.room.objectList) do 
if tfm.get.room.objectList[id].y > 350 then
table.insert(to_remove, id)
end
end
for index, id in ipairs(to_remove) do
tfm.exec.removeObject(id)
end
else
for name,player in pairs(tfm.get.room.playerList) do
if player.score == highest_score then
tfm.exec.giveCheese(name)
tfm.exec.playerVictory(name)
print("You won!")
else
print("You didn't win :(")
end
end
end
end

function addScore(name, id, x, y)
if last_played[name] ~= id then
last_played[name] = id
if tfm.get.room.objectList[id].y < 325 and 275 < tfm.get.room.objectList[id].y then
print("Excellent! +3 points")
tfm.exec.setPlayerScore(name, 3, true)
elseif tfm.get.room.objectList[id].y < 275 and 205 < tfm.get.room.objectList[id].y then
print("A little early! +1 points")
tfm.exec.setPlayerScore(name, 1, true)
elseif tfm.get.room.objectList[id].y < 395 and 325 < tfm.get.room.objectList[id].y then
print("A little late! +1 points")
tfm.exec.setPlayerScore(name, 1, true)
elseif tfm.get.room.objectList[id].y > 395 then
print("Too late!")
elseif tfm.get.room.objectList[id].y < 205 then
print("Too early!")
end
end
highest_score = math.max(tfm.get.room.playerList[name].score, highest_score)
end

function eventKeyboard(name, key, down, x, y)
if key==1 then
for id, object in pairs(tfm.get.room.objectList) do 
if tfm.get.room.objectList[id].x == 300 and tfm.get.room.objectList[id].y > 150 and tfm.get.room.objectList[id].y < 450 then
addScore(name, id, x, y)
end
end
end
if key==2 then
for id, object in pairs(tfm.get.room.objectList) do 
if tfm.get.room.objectList[id].x == 500 and tfm.get.room.objectList[id].y > 150 and tfm.get.room.objectList[id].y < 450 then
addScore(name, id, x, y)
end
end
end
if key==3 then
for id, object in pairs(tfm.get.room.objectList) do 
if tfm.get.room.objectList[id].x == 100 and tfm.get.room.objectList[id].y > 150 and tfm.get.room.objectList[id].y < 450 then
addScore(name, id, x, y)
end
end
end
if key==0 then
for id, object in pairs(tfm.get.room.objectList) do 
if tfm.get.room.objectList[id].x == 700 and tfm.get.room.objectList[id].y > 150 and tfm.get.room.objectList[id].y < 450 then
addScore(name, id, x, y)
end
end
end
end

for name,player in pairs(tfm.get.room.playerList) do
eventNewPlayer(name)
end

tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoScore(True)
tfm.exec.setGameTime(120)
tfm.exec.newGame(7815496)

