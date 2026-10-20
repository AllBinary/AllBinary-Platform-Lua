--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package tags

local CustomTagSupport = require("tags.CustomTagSupport")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommandTag = {}
CommandTag.__index = CommandTag
CommandTag.className = "CommandTag"
setmetatable(CommandTag, {__index = CustomTagSupport})

function CommandTag:_init_fields()
    self.tagStrings = TagStrings.getInstance()
    self.command = nil
end


function CommandTag.new()
    local self = setmetatable(CustomTagSupport.new(), CommandTag)
    self:_init_fields()
    return self
end


function CommandTag:setCommand(command)
        self.command = command
end


function CommandTag:getCommand()
        return self.command
end

return CommandTag

