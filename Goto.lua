function gotoapi(gx, gy, gz, enddirlet)
    --local tArgs = {...}
    face = 0
    local r = 1
    tru = 1
    local tturned = 0
    local modems = { peripheral.find("modem", function(name, modem)
      return modem.isWireless() -- Check this modem is wireless.
    end) }
    rednet.open(modems[1])
    local cx,cy,cz = gps.locate(2,false)
    if (gx and gy and gz) == nil then
      print("Incorrect usage of Function.")
      --print("goto <x> <y> <z> (<Heading>)")
    else
    --local gx = tonumber(tArgs[1])
    --local gy = tonumber(tArgs[2])
    --local gz = tonumber(tArgs[3])
    --local enddirlet = tArgs[4]
    local x
    local y
    local z
    if enddirlet ~= nil then
        if enddirlet == "n" or enddirlet == "north" then
            enddir = 4
        end
        if enddirlet == "s" or enddirlet == "south" then
            enddir = 2
        end
        if enddirlet == "e" or enddirlet == "east" then
            enddir = 1
        end
        if enddirlet == "w" or enddirlet == "west" then
            enddir = 3
        end
    end
    function tturnup()
        tturned = tturned + 1
        if tturned > 25 then
            os.reboot()
        end
    end

    function c_face()
        while face >= 5 do
            face = face - 4
        end
        while face <= 0 do
            face = face + 4
        end
    end




function gps_face_math(cur_x,cur_z)
  mnx,mny,mnz = gps.locate(3,false)
  if mnx > cur_x then
    face = 1
  end
  if mnx < cur_x then
    face = 3
  end
  if mnz > cur_z then
    face = 2
  end
  if mnz < cur_z then
    face = 4
  end
end
function forward_get_face()
  tturned = 0
  cux,cuy,cuz = gps.locate(3,false)
  while turtle.forward() == false do
    tturned = 0
   if turtle.up() == false then
        --turtle.digUp()
   end
  end
  gps_face_math(cux,cuz)
  return true
end



    function get_Face()
    while turtle.forward() == false do
        tturned = 0
       if turtle.up() == false then
            --turtle.digUp()
       end
      end
    nx,ny,nz = gps.locate(3,false)
    gps_face_math(cx,cz)
    end
    function calc()
    x = nx - gx
    y = ny - gy
    z = nz - gz
    end
    function setDir(dir)
        noredoturndir = 0
      c_face()
      if dir == 4 then
        if face == 1 then
            gototurnleft = 1
            --print("E-to-N")
            noredoturndir = 1
        end
      end
      if dir == 1 then
        if face == 4 then
            gototurnleft = 0
            --print("N-to-E")
            noredoturndir = 1
        end
      end
    
      if noredoturndir == 0 then
         if face >= dir then
            gototurnleft = 1
         end
         if face < dir then
            gototurnleft = 0
        end
      end
      
      if dir == 4 then
        if face == 1 then
            gototurnleft = 1
            --print("E-to-N")
            noredoturndir = 1
        end
      end
      if dir == 1 then
        if face == 4 then
            gototurnleft = 0
            --print("N-to-E")
            noredoturndir = 1
        end
      end
      while dir ~= face do
        c_face()
        if gototurnleft == 1 then
            turtle.turnLeft()
            face = face - 1
            tturnup()
        end
        if gototurnleft == 0 then
            turtle.turnRight()
            face = face + 1
            tturnup()
        end
      c_face()
      end
      noredoturndir = 0
    end
    function f()
        while not forward_get_face() do
        tturned = 0
        if not turtle.up()  then
            --turtle.digUp()
        end
        y = y + 1
        end
    end
    function go()
        tturned = 0
    if x < 0 then
      setDir(1)
      while x ~= 0 do
       f()
       x = x + 1
      end
    end
    if x > 0 then
      setDir(3)
      while x ~= 0 do
       f()
       x = x - 1
      end
    end
    if z < 0 then
      setDir(2)
      while z ~= 0 do
       f()
       z = z + 1
      end
    end
    if z > 0 then
      setDir(4)
      while z ~= 0 do
       f()
       z = z - 1
      end
    end
    while y < 0 do
        tturned = 0
      if turtle.up() ~= true then
       --turtle.digUp()
      end
      y = y + 1
    end
    while y > 0 do
        tturned = 0
      if turtle.down() ~= true then
       --turtle.digDown()
      end
      y = y - 1
    end
    end
    
    
    
    tonumber(gx)
    tonumber(gy)
    tonumber(gz)
    get_Face()
    calc()
    go()
    if enddir ~= nil then
        setDir(enddir)
    end
    
    end
    end
    
    
    
    function goto(Workinggototable)   
      gtloop = 0
      gtloopsleep = 0.01
      gtloopsleep2 = gtloopsleep ^ 2
      gototable = {}                    
      goit = 1
      while true do
        while goit < 5 do
          if Workinggototable[goit] ~= nil then
              table.insert(gototable, Workinggototable[goit])
          elseif Workinggototable[goit] == nil then
              table.insert(gototable, Workinggototable[goit])
              break
          end
          goit = goit + 1 
        end 
        gotoapi(gototable[1], gototable[2], gototable[3], gototable[4]) 
        local ecx,ecy,ecz = gps.locate(5,false)
        if ecx == tonumber(gototable[1]) then
          if ecy == tonumber(gototable[2]) then
            if ecz == tonumber(gototable[3]) then
                if enddir ~= nil then
                    if face == enddir then
                        break
                    end
                else
                    break
                end
            end
          end
        end
        if gtloop < 100 then
          gtloop = gtloop + 1
        end
        if gtloop > 5 then     
          if gtloopsleep > 2.5 then
            gtloopsleep = 2.5
          end
          if gtloopsleep2 > 2.5 then
            gtloopsleep2 = 2.5
          end
          sleep(gtloopsleep2)
          gtloopsleep = gtloopsleep * 1.1
          gtloopsleep2 = gtloopsleep ^ 2
        end
      end
    end