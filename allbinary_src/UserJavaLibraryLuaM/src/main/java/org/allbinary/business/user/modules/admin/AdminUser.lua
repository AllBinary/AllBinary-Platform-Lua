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
-- package org.allbinary.business.user.modules.admin

-- local HashMap = require("java.util.HashMap")
local User = require("org.allbinary.business.user.modules.User")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdminUser = {}
AdminUser.__index = AdminUser
AdminUser.className = "AdminUser"
setmetatable(AdminUser, {__index = User})

function AdminUser.new(...)
    local count = select("#", ...)
    if count == 0 then return AdminUser._new0(...)
    elseif count == 1 then return AdminUser._new1(...)
    end
end


function AdminUser._new0()
    local self = setmetatable(User.new(), AdminUser)
        -- super(...) made self above
    return self
end


function AdminUser._new1(userHashMap)
    local self = setmetatable(User.new(userHashMap), AdminUser)
        -- super(...) made self above
    return self
end


function AdminUser:validateSession(weblisketSession)
        User.validateSession(self, weblisketSession)
        self:updateSession(weblisketSession)
end


function AdminUser:updateSession(weblisketSession)
        weblisketSession:setStoreName(self:getPermissions())
end

return AdminUser

