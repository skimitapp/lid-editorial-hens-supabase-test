-- LID Invitations — allow guest browsers to read ONLY the hero image
-- attached to a published invitation. The bucket itself remains private.

create policy "Anyone can view published invitation images"
on storage.objects
for select
to anon, authenticated
using (
  bucket_id = 'invitation-images'
  and exists (
    select 1
    from public.invitations i
    where i.is_published = true
      and i.hero_image_path = storage.objects.name
      and i.id::text = (storage.foldername(storage.objects.name))[2]
  )
);
