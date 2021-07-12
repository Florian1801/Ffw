Camera = {}
Camera.__index = Camera

--[[
    Camera = class
    
    local [retVal] = Camera.create(vector3(0, 0, 0), vector3(0, 0, 0)) -- Création Cam | Premier Pos = Cam | Deuxieme Pos = Point ou il regarde

    [retVal]:CamActive(true/false) -- Activer la camera > True Activé Animation / False Désactiver Animation

    [retVal]:DeleteCam(true/false) -- Supprimer la camera > True Activé Animation / False Désactiver Animation

    [retVal]:SetFov(float) -- Set Camera Fov
]]

function Camera.create(PosCam, PosHeading)
    local self = {}

    self.id = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    self.exist = DoesCamExist(self.id)

    SetCamCoord(self.id, PosCam)
    PointCamAtCoord(self.id, PosHeading)

    return setmetatable(self, Camera)
end

function Camera:camActive(bool)
    if self.exist then
        SetCamActive(self.id, true)
        RenderScriptCams(true, bool, 2000, true, false)
    end
end

function Camera:deleteCam(bool)
    if self.exist then
    	SetCamActive(self.id, false)
	RenderScriptCams(false, bool, 2000, true, true)
	DestroyCam(self.id, false)
    end
end

-- Fait par Florian et non par Narek qui c'est atribuer mon travail ! 

function Camera:setFov(float)
    if self.exist then
        SetCamFov(self.id, float)
    end
end
