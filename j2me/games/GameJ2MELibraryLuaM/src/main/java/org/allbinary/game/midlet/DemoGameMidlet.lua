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
-- package org.allbinary.game.midlet

local DemoGameMidlet = {}
package.loaded["org.allbinary.game.midlet.DemoGameMidlet"] = DemoGameMidlet

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

local GameCanvasRunnableInterface = java_lazy("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ClientInformationFactory = java_lazy("org.allbinary.logic.system.security.licensing.ClientInformationFactory")
local PrimaryThreadPool = java_lazy("org.allbinary.thread.PrimaryThreadPool")
local NullGameCanvasRunnable = java_lazy("org.allbinary.game.displayable.canvas.NullGameCanvasRunnable")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local GameMidlet = require("org.allbinary.game.midlet.GameMidlet")
local CreateGameRunnable = java_lazy("org.allbinary.game.midlet.CreateGameRunnable")
local DemoRunnable = java_lazy("org.allbinary.game.midlet.DemoRunnable")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

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

-- class table DemoGameMidlet is declared before the requires
DemoGameMidlet.__index = DemoGameMidlet
DemoGameMidlet.className = "DemoGameMidlet"
DemoGameMidlet.javaClassName = "org.allbinary.game.midlet.DemoGameMidlet"
setmetatable(DemoGameMidlet, {__index = GameMidlet})


function DemoGameMidlet._jinit(self, clientInformationFactory)
    java_super_init(GameMidlet, self, clientInformationFactory)
        -- super(...) made self above
    return self
end

function DemoGameMidlet.new(...)
    local self = setmetatable({}, DemoGameMidlet)
    DemoGameMidlet._jinit(self, ...)
    return self
end


-- throws Exception
function DemoGameMidlet:isContinue()
        local hashtable = self:getStartStateHashtable()
        if hashtable ~= nil and hashtable:size() > 0 then
            return true
        else
            return false
        end
end
java_overload(DemoGameMidlet, "isContinue", 0)


function DemoGameMidlet:getHighestLevel()
        return 1
end
java_overload(DemoGameMidlet, "getHighestLevel", 0)


-- throws Exception
function DemoGameMidlet:createDemoGameCanvasRunnableInterface()
        self.logUtil:putF(self.commonStrings.NOT_IMPLEMENTED, self, self.commonStrings.CREATE)
        return NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE
end
java_overload(DemoGameMidlet, "createDemoGameCanvasRunnableInterface", 0)


-- throws Exception
function DemoGameMidlet:createGameCanvasRunnable(allBinaryGameLayerManager)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(DemoGameMidlet, "createGameCanvasRunnable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function DemoGameMidlet:createGameCanvasRunnableInterface()
        return self:createGameCanvasRunnable(self:createGameLayerManager())
end
java_overload(DemoGameMidlet, "createGameCanvasRunnableInterface", 0)


function DemoGameMidlet:demoSetup()
end
java_overload(DemoGameMidlet, "demoSetup", 0)


function DemoGameMidlet:postDemoSetup()
end
java_overload(DemoGameMidlet, "postDemoSetup", 0)


-- throws Exception
function DemoGameMidlet:setDemo()
        self.logUtil:putF(self.commonStrings.START, self, "setDemo")
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:start()
        PrimaryThreadPool.getInstance():runTask(DemoRunnable.new(self))
end
java_overload(DemoGameMidlet, "setDemo", 0)


-- throws Exception
function DemoGameMidlet:createGame()
        local CREATE_GAME = "createGame"
        self.logUtil:putF(self.commonStrings.START, self, CREATE_GAME)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:start()
        local hashtable = self:getStartStateHashtable()
        self:setStartStateHashtable(StdUtil.getInstance().NULL_TABLE)
        PrimaryThreadPool.getInstance():runTask(CreateGameRunnable.new(self, hashtable))
        self.logUtil:putF(self.commonStrings.END, self, CREATE_GAME)
end
java_overload(DemoGameMidlet, "createGame", 0)


function DemoGameMidlet:isReady()
        return true
end
java_overload(DemoGameMidlet, "isReady", 0)

return DemoGameMidlet

