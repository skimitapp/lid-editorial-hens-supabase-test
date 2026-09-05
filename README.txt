LID Invitations — Editorial Hens Night — Supabase Connected Test

This build preserves the locked Editorial Hens Night visual design and replaces browser-only localStorage with the LID Invitations Supabase backend.

Connected functionality:
- Supabase host login
- Customer-owned invitation loading
- Editable invitation content saved to public.invitations.content
- Hero image upload to private invitation-images storage
- Unique public guest URL using ?slug=<public_slug>
- Share automatically publishes the invitation
- Guest RSVP writes to public.rsvps
- Host Manage RSVPs reads live RSVP data
- Host Edit / Share controls are hidden from guest view

Required Supabase project:
https://wjzlfksfcinkninqhzxg.supabase.co

IMPORTANT — run the SQL in PUBLIC_HERO_IMAGE_POLICY.sql once before testing customer-uploaded hero images on a guest link.

Test flow:
1. Deploy this folder to a web host (Vercel is recommended).
2. Open the root URL with no ?slug parameter.
3. Sign in using the test Supabase Auth customer you created.
4. Edit and save the invitation.
5. Click Share. This publishes the invitation and displays the unique guest link.
6. Open the guest link in a private/incognito browser.
7. Submit an RSVP.
8. Return to the host view > Share > Manage RSVPs to see the response.

Security:
- Only the Supabase publishable browser key is included in index.html.
- No service-role key, database password, or secret key is included.
- Database and Storage access rely on RLS policies.

Deployment trigger 2
