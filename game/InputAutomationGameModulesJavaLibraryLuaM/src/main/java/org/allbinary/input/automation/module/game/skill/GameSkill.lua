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
-- package org.allbinary.input.automation.module.game.skill

local GameSkill = {}
package.loaded["org.allbinary.input.automation.module.game.skill.GameSkill"] = GameSkill

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local GameSkillPropertyInterface = java_lazy("org.allbinary.input.automation.module.game.skill.GameSkillPropertyInterface")
local GameSkillType = java_lazy("org.allbinary.input.automation.module.game.skill.GameSkillType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameSkill is declared before the requires
GameSkill.__index = GameSkill
GameSkill.className = "GameSkill"
GameSkill.javaClassName = "org.allbinary.input.automation.module.game.skill.GameSkill"

function GameSkill:_init_fields()
    if self.gameSkillType == nil then self.gameSkillType = nil end
    if self.extra == nil then self.extra = nil end
    if self.time == nil then self.time = 0 end
    if self.vector == nil then self.vector = nil end
    self.GAME_SKILL_LABEL = "GameSkill: "
    self.EXTRA_LABEL = "Extra: "
    self.TIME_LABEL = "Time: "
end


function GameSkill._jinit(self, gameSkillType, extra, time)
    GameSkill._init_fields(self)
        self:setGameSkillType(gameSkillType)
        self:setExtra(extra)
        self:setTime(time)
        self.vector = BasicArrayListD.new()
        GameSkill.hashMap:put(tostring(StringMaker.new():append(self:getGameSkillType():getName()):append(CommonSeps.getInstance().SPACE):append(extra)), self)
    return self
end

function GameSkill.new(...)
    local self = setmetatable({}, GameSkill)
    GameSkill._jinit(self, ...)
    return self
end


function GameSkill:getGameSkillType()
        return self.gameSkillType
end


function GameSkill:setGameSkillType(gameSkillType)
        self.gameSkillType = gameSkillType
end


function GameSkill:getExtra()
        return self.extra
end


function GameSkill:setExtra(extra)
        self.extra = extra
end


function GameSkill:getTime()
        return self.time
end


function GameSkill:setTime(time)
        self.time = time
end


function GameSkill:addProperty(gameSkillPropertyInterface)
        self.vector:add(gameSkillPropertyInterface)
end


function GameSkill:getProperties()
        return self.vector
end


function GameSkill.getInstance(gameSkillType, extra)
        return GameSkill.hashMap:get(tostring(StringMaker.new():append(gameSkillType:getName()):append(CommonSeps.getInstance().SPACE):append(extra)))
end


function GameSkill:toString()
        local commonSeps = CommonSeps.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.GAME_SKILL_LABEL)
        stringBuffer:append(tostring(self:getGameSkillType()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(self.EXTRA_LABEL)
        stringBuffer:append(self:getExtra())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(self.TIME_LABEL)
        stringBuffer:appendlong(self:getTime())
        return tostring(stringBuffer)
end
GameSkill.__tostring = function(self) return self:toString() end

GameSkill.hashMap = StdUtil.getInstance():createHashMap()

return GameSkill

