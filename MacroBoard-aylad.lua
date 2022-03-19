-- video explanation is HERE: https://www.youtube.com/watch?v=Arn8ExQ2Gjg
-- get luamacros HERE: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
clear() --clear the console from last run   

K = require("Keys")
config = K.getKeys()
print(config[186])

--local keyboardIdentifier1 = '0000AAA'
--local keyboardIdentifier2 = '0000AAA'
local keyboardIdentifier1 = '170C94C8'
local keyboardIdentifier2 = '168EC35'

--Set kb1
if keyboardIdentifier1 == '0000AAA' then
   lmc_assign_keyboard('MACROS1');
else lmc_device_set_name('MACROS1', keyboardIdentifier1);
end    

--Set kb2
if keyboardIdentifier2 == '0000AAA' then
   lmc_assign_keyboard('MACROS2');
else lmc_device_set_name('MACROS2', keyboardIdentifier2);
end

--This lists connected keyboards                                          2
dev = lmc_get_devices()
for key,value in pairs(dev) do
  print(key..':')
  for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end

-- Hide window to tray to keep taskbar tidy  
lmc.minimizeToTray = true
--lmc_minimize()

--Start Script 1
sendToAHK1 = function (key)
   local file = io.open("keypressed1.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!
   file:write(key)
   file:flush() --"flush" means "save." Lol.
   file:close()
   lmc_send_keys('{F24}')  -- This presses F24. Using the F24 key to trigger AutoHotKey is probably NOT the best method. Feel free to program something better!
end

--Start Script 2
sendToAHK2 = function (key)
print('sendToAHK2 key: ' .. key)
   local file2 = io.open("keypressed2.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!
   file2:write(key)
   file2:flush() --"flush" means "save." Lol.
   file2:close()
   lmc_send_keys('{F13}')  -- This presses F24. Using the F24 key to trigger AutoHotKey is probably NOT the best method. Feel free to program something better!
end



-- define callback MACROS1
lmc_set_handler('MACROS1', function(button, direction)  
print('MACROS1 button: ' .. button)
print('MACROS1 config button: ' .. config[button])
   if (direction == 0) then return end -- ignore key upstrokes.
   if type(config[button]) == "string" then
      print(' ')
      print('Your key ID number is:   ' .. button)
      print('Macros 1 was assigned string:    ' .. config[button])
      sendToAHK1(config[button])
   else
       print(' ')
       print('Not yet assigned: ' .. button)
   end
end)   

-- define callback MACROS2
lmc_set_handler('MACROS2', function(button, direction)
print('MACROS2 button: ' .. button)
print('MACROS2 config button: ' .. config[button])
   if (direction == 0) then return end -- ignore key upstrokes.
   if type(config[button]) == "string" then
      print(' ')
      print('Your key ID number is:   ' .. button)
      print('It was assigned string:    ' .. config[button])
      sendToAHK2(config[button])
   else
       print(' ')
       print('Not yet assigned: ' .. button)
   end
end)
