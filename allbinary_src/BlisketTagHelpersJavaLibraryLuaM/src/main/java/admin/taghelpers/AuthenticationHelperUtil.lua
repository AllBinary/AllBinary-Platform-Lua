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
-- package admin.taghelpers

local AuthenticationHelperUtil = {}
package.loaded["admin.taghelpers.AuthenticationHelperUtil"] = AuthenticationHelperUtil

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local HttpFilePermissions = java_lazy("org.allbinary.logic.communication.http.file.upload.HttpFilePermissions")
local HttpRequestUtil = java_lazy("org.allbinary.logic.communication.http.request.HttpRequestUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AuthenticationHelper = java_lazy("admin.taghelpers.AuthenticationHelper")

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

-- class table AuthenticationHelperUtil is declared before the requires
AuthenticationHelperUtil.__index = AuthenticationHelperUtil
AuthenticationHelperUtil.className = "AuthenticationHelperUtil"
AuthenticationHelperUtil.javaClassName = "admin.taghelpers.AuthenticationHelperUtil"

function AuthenticationHelperUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function AuthenticationHelperUtil._jinit(self)
    AuthenticationHelperUtil._init_fields(self)
    return self
end

function AuthenticationHelperUtil.new()
    return AuthenticationHelperUtil._jinit(setmetatable({}, AuthenticationHelperUtil))
end


function AuthenticationHelperUtil.getInstance()
        return AuthenticationHelperUtil.instance_f
end


-- throws Exception
function AuthenticationHelperUtil:isAuthorized(authenticationHelper, filePath)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
            self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. filePath, self, "isAuthorized()")
        end
        local endIndex = HttpRequestUtil.getInstance():getLastSeparatorIndex(filePath)
        local fullPath = AbPath.new(tostring(URLGLOBALS.getWebappPath()) .. string.sub(filePath, (0) + 1, endIndex), StringUtil.getInstance().EMPTY_STRING)
        local downloadFilePermissions = HttpFilePermissions.new(fullPath)
        local userRoles = downloadFilePermissions:getUserRoles()
        local userRole = authenticationHelper:getRole()
        local basicUserRole = userRole:getBasicUserRole()
        if userRoles:contains(basicUserRole) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Authorized", self, "isAuthorized()")
            end
            return true
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Not Authorized: " .. tostring(basicUserRole), self, "isAuthorized()")
            end
            return false
        end
end

AuthenticationHelperUtil.instance_f = AuthenticationHelperUtil.new()

return AuthenticationHelperUtil

