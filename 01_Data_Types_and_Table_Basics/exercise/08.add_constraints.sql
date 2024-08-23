ALTER TABLE minions_info

-- it`s better name for constraint: UQ_id_email
ADD CONSTRAINT unique_containt
UNIQUE (id, email),

-- it`s better name for constraint: CK_banana_is_positive
ADD CONSTRAINT banana_check
CHECK (banana > 0);