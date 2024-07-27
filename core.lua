local frame = CreateFrame("Frame", nil, UIParent);
frame:SetFrameStrata("TOOLTIP");
local texture = frame:CreateTexture();
texture:SetTexture([[Interface\Cooldown\star4]]);
texture:SetBlendMode("ADD");
texture:SetAlpha(0.5);

local x, y, speed = 0, 0, 0;
local MAX_SPEED = 1024;
local SPEED_DECAY = 2048;
local SIZE_MODIFIER = 6;
local MIN_SIZE = 16;

local function isNan(value)
  return value ~= value;
end

local function OnUpdate(_, elapsed)
  if isNan(speed) then speed = 0; end
  if isNan(x) then x = 0; end
  if isNan(y) then y = 0; end

  local prevX, prevY = x, y;
  x, y = GetCursorPosition();
  local dX, dY = x - prevX, y - prevY;

  local distance = math.sqrt(dX * dX + dY * dY);
  local decayFactor = SPEED_DECAY ^ -elapsed;
  speed = math.min(decayFactor * speed + (1 - decayFactor) * distance / elapsed, MAX_SPEED);

  local size = speed / SIZE_MODIFIER - MIN_SIZE;
  if size > 0 then
    local scale = UIParent:GetEffectiveScale();
    texture:SetHeight(size);
    texture:SetWidth(size);
    texture:SetPoint("CENTER", UIParent, "BOTTOMLEFT", (x + 0.5 * dX) / scale, (y + 0.5 * dY) / scale);
    texture:Show();
  else
    texture:Hide();
  end
end

frame:SetScript("OnUpdate", OnUpdate);
