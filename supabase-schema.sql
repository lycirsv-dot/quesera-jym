-- QUESERA JYM · Esquema Supabase (plan gratis)
-- 1) Crea un proyecto gratis en https://supabase.com
-- 2) Abre SQL Editor, pega esto y dale RUN
-- 3) Copia Project URL + anon public key (Settings > API)

create table if not exists productos (
  id text primary key,
  nombre text not null,
  descripcion text default '',
  precio integer not null default 0,
  unidad text not null default 'kg',
  categoria text default 'Frescos',
  oferta integer not null default 0,
  foto text default '',
  emoji text default '🧀',
  nuevo boolean not null default false,
  stock integer not null default 1,
  fecha text default '',
  updated_at timestamptz default now()
);

alter table productos enable row level security;

drop policy if exists "lectura publica" on productos;
create policy "lectura publica" on productos
  for select using (true);

drop policy if exists "escritura publica" on productos;
create policy "escritura publica" on productos
  for all using (true) with check (true);
