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
-- package org.allbinary.logic.control.search

local SearchData = {}
package.loaded["org.allbinary.logic.control.search.SearchData"] = SearchData

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

-- class table SearchData is declared before the requires
SearchData.__index = SearchData
SearchData.className = "SearchData"
SearchData.javaClassName = "org.allbinary.logic.control.search.SearchData"


function SearchData._jinit(self)
    return self
end

function SearchData.new(...)
    local self = setmetatable({}, SearchData)
    SearchData._jinit(self, ...)
    return self
end

SearchData.TOTAL_NUMBER_PAGES = "SEARCHDATA_TOTALNUMBEROFPAGES"
SearchData.TOTAL_NUMBER_ITEMS_ON_THIS_PAGE = "SEARCHDATA_TOTALNUMBEROFITEMSONTHISPAGE"
SearchData.TOTAL_NUMBER_ITEMS = "SEARCHDATA_TOTALNUMBEROFITEMS"
SearchData.DEFAULT_PAGE_LENGTH = 10
SearchData.GENERATESTATICPAGES = "Generate Static Pages"
SearchData.SEARCHBYSUMMARY = "Search By Summary"
SearchData.SEARCHBYDESCRIPTION = "Search By Description"
SearchData.SEARCHBYCATEGORY = "Search By Category"
SearchData.SEARCHCATEGORIES = "Search Categories"
SearchData.FILENAME = "SEARCHDATA_BASEFILENAME"
SearchData.COLUMNNAME = "COLUMN_NAME"
SearchData.COLUMNVALUE = "COLUMN_VALUE"
SearchData.PARAMS = "SEARCHDATA_PARAMS"
SearchData.LENGTH = "SEARCHDATA_LENGTH"
SearchData.ORDER = "SEARCHDATA_ORDER"
SearchData.PAGE = "SEARCHDATA_PAGE"
SearchData.FIELDS = "SEARCHDATA_FIELDS"
SearchData.FIELD = "SEARCHDATA_FIELD"
SearchData.SORTBY = "SEARCHDATA_SORTBY"
SearchData.TYPE = "SEARCHDATA_TYPE"
SearchData.PAGE_INFO = "pageInfo"
SearchData.SEARCH = "search"
SearchData.MAKEPUBLIC = "Make Public"

return SearchData

